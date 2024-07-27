import 'dart:ui';

import 'package:apple_music_search/feature/album/services/release_date_formatter.dart';
import 'package:apple_music_search/feature/album/view_models/albums_view_model.dart';
import 'package:apple_music_search/feature/album/views/tracks_screen.dart';
import 'package:apple_music_search/feature/album/views/widgets/album_cover.dart';
import 'package:apple_music_search/feature/search/models/artist/artist_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlbumsScreen extends ConsumerStatefulWidget {
  const AlbumsScreen(
    this.artist, {
    super.key,
  });

  final ArtistModel artist;

  @override
  ConsumerState<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends ConsumerState<AlbumsScreen> {
  late final viewModelProvider =
      albumsViewModelProvider(widget.artist.artistId);

  final _pageController = PageController(
    viewportFraction: 0.7,
  );

  int _currentPageIndex = 0;
  final _scaleOffset = ValueNotifier<double>(0);
  int? _currentAlbumId;

  bool _dragging = false;
  bool _showAlbumTracks = false;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page != null) {
        _scaleOffset.value = _pageController.page!;
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onBackPressed() {
    if (_showAlbumTracks) {
      _showsTrack(false);
    } else {
      Navigator.of(context).pop();
    }
  }

  void _onPageChanged(int value) {
    setState(() {
      _currentPageIndex = value;
      _currentAlbumId =
          ref.read(viewModelProvider.notifier).albumIdAtIndex(value);
    });
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    if (_dragging) {
      return;
    }
    _dragging = true;
    _showsTrack(details.delta.dy.isNegative);
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    _dragging = false;
  }

  void _onShowAlbumPressed() {
    _showsTrack(false);
  }

  void _onShowTrackPressed() {
    _showsTrack(true);
  }

  void _showsTrack(bool shows) {
    setState(() {
      _showAlbumTracks = shows;
    });
  }

  @override
  Widget build(BuildContext context) {
    _currentAlbumId =
        ref.read(viewModelProvider.notifier).albumIdAtIndex(_currentPageIndex);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: _onBackPressed,
        ),
      ),
      body: ref.watch(viewModelProvider).when(
            data: (data) => data.isEmpty
                ? const Center(
                    child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("No Albums founded"),
                    ],
                  ))
                : GestureDetector(
                    onVerticalDragUpdate: _onVerticalDragUpdate,
                    onVerticalDragEnd: _onVerticalDragEnd,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: AnimatedSwitcher(
                            duration: 250.ms,
                            child: LayoutBuilder(
                              key: ValueKey(_currentPageIndex),
                              builder: (context, constraints) => Image.network(
                                data[_currentPageIndex].artworkUrl100,
                                fit: BoxFit.cover,
                                width: constraints.maxWidth,
                                height: constraints.maxHeight,
                              ),
                            ),
                          ),
                        ),
                        BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10,
                            sigmaY: 10,
                          ),
                          child: Container(
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                        PageView.builder(
                          controller: _pageController,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final album = data[index];
                            return Center(
                              child: ValueListenableBuilder(
                                valueListenable: _scaleOffset,
                                builder: (context, value, child) {
                                  final difference =
                                      (value - index).abs() * 0.2;
                                  final scale = 1 - difference;
                                  return Transform.scale(
                                    scale: scale,
                                    child: AlbumCover(
                                      coverUrlString: album.artworkUrl100,
                                      albumName: album.collectionName,
                                      releaseYear: ReleaseDateFormatter()
                                          .dateTime(album.releaseDate)
                                          .year
                                          .toString(),
                                      genre: album.primaryGenreName,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          onPageChanged: _onPageChanged,
                        )._animatePageY(
                          context: context,
                          forward: _showAlbumTracks,
                          reverse: false,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SafeArea(
                            child: IconButton(
                              onPressed: _onShowTrackPressed,
                              icon: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Transform.translate(
                                    offset: const Offset(0, 10),
                                    child: Icon(
                                      Icons.queue_music_rounded,
                                      size: 32,
                                      color: Colors.grey.shade100,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.grey.shade100,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )._animatePageY(
                            context: context,
                            forward: _showAlbumTracks,
                            reverse: false),
                        if (_currentAlbumId != null)
                          TracksScreen(
                            albumId: _currentAlbumId!,
                            onShowAlbumPressed: _onShowAlbumPressed,
                          )._animatePageY(
                            context: context,
                            forward: _showAlbumTracks,
                            reverse: true,
                          ),
                      ],
                    ),
                  ),
            error: (error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
    );
  }
}

extension VerticalMoveAnimate on Widget {
  Animate _animatePageY({
    required BuildContext context,
    required bool forward,
    required bool reverse,
  }) {
    final height = MediaQuery.sizeOf(context).height;
    return animate(
      autoPlay: false,
      target: forward ? 1 : 0,
    ).moveY(
      begin: reverse ? height : 0,
      end: reverse ? 0 : -height,
      duration: 1.seconds,
      curve: Curves.easeInOut,
    );
  }
}
