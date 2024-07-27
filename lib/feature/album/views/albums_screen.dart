import 'dart:ui';

import 'package:apple_music_search/feature/album/services/release_date_formatter.dart';
import 'package:apple_music_search/feature/album/view_models/albums_view_model.dart';
import 'package:apple_music_search/feature/album/views/tracks_screen.dart';
import 'package:apple_music_search/feature/album/views/widgets/album_cover.dart';
import 'package:apple_music_search/feature/album/views/widgets/album_track_transition_button.dart';
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
                        )
                            .animate(
                              autoPlay: false,
                              target: _showAlbumTracks ? 1 : 0,
                            )
                            .moveY(
                              begin: 0,
                              end: -MediaQuery.sizeOf(context).height,
                              duration: 1.seconds,
                              curve: Curves.easeInOut,
                            ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SafeArea(
                            child: AlbumTrackTransitionButton(
                              onPressed: _onShowTrackPressed,
                              showsTrack: true,
                            ),
                          ),
                        ),
                        if (_currentAlbumId != null)
                          TracksScreen(
                            albumId: _currentAlbumId!,
                            onShowAlbumPressed: _onShowAlbumPressed,
                          )
                              .animate(
                                autoPlay: false,
                                target: _showAlbumTracks ? 1 : 0,
                              )
                              .moveY(
                                begin: MediaQuery.sizeOf(context).height,
                                end: 0,
                                duration: 1.seconds,
                                curve: Curves.easeInOut,
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
