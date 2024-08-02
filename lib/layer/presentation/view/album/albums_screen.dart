import 'dart:ui';

import 'package:apple_music_search/layer/presentation/utils/release_date_formatter.dart';
import 'package:apple_music_search/layer/domain/entity/album/album.dart';
import 'package:apple_music_search/layer/domain/entity/artist/artist.dart';
import 'package:apple_music_search/layer/presentation/view/album/songs_screen.dart';
import 'package:apple_music_search/layer/presentation/view/album/widgets/album/album_cover.dart';
import 'package:apple_music_search/layer/presentation/view/album/widgets/album/album_to_songs_button.dart';
import 'package:apple_music_search/layer/presentation/view_model/album/albums_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlbumsScreen extends ConsumerStatefulWidget {
  const AlbumsScreen(
    this.artist, {
    super.key,
  });

  final Artist artist;

  @override
  ConsumerState<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends ConsumerState<AlbumsScreen> {
  final _pageController = PageController(
    viewportFraction: 0.7,
  );

  int _currentPageIndex = 0;
  final _scaleOffset = ValueNotifier<double>(0);
  Album? _currentAlbum;

  bool _dragging = false;
  bool _showAlbumSongs = false;

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
    Navigator.of(context).pop();
  }

  void _onPageChanged(int value) {
    setState(() {
      _currentPageIndex = value;
    });
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    if (_dragging) {
      return;
    }
    _dragging = true;
    _showsSong(details.delta.dy.isNegative);
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    _dragging = false;
  }

  void _onShowAlbumPressed() {
    _showsSong(false);
  }

  void _onShowSongsPressed() {
    _showsSong(true);
  }

  void _showsSong(bool shows) {
    setState(() {
      _showAlbumSongs = shows;
    });
  }

  @override
  Widget build(BuildContext context) {
    _currentAlbum = ref
        .read(albumsViewModelProvider(widget.artist.id).notifier)
        .albumAtIndex(_currentPageIndex);

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: IconButton(
          icon: const Icon(Icons.keyboard_arrow_up_rounded),
          onPressed: _onShowAlbumPressed,
        )._animateFadeIn(
          forward: _showAlbumSongs,
          reverse: false,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: _onBackPressed,
        )._animateFadeOut(
          forward: _showAlbumSongs,
          reverse: false,
        ),
      ),
      body: ref.watch(albumsViewModelProvider(widget.artist.id)).when(
            data: (data) => data.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("No Albums founded"),
                      ],
                    ),
                  )
                : GestureDetector(
                    onVerticalDragUpdate: _onVerticalDragUpdate,
                    onVerticalDragEnd: _onVerticalDragEnd,
                    child: Stack(
                      children: [
                        AnimatedSwitcher(
                          duration: 250.ms,
                          child: LayoutBuilder(
                            key: ValueKey(_currentPageIndex),
                            builder: (context, constraints) => Image.network(
                              data[_currentPageIndex].coverImageUrl,
                              fit: BoxFit.cover,
                              width: constraints.maxWidth,
                              height: constraints.maxHeight,
                            ),
                          ),
                        ),
                        ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              color: Colors.black.withOpacity(0.3),
                            ),
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
                                      coverUrlString: album.coverImageUrl,
                                      albumName: album.title,
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
                          forward: _showAlbumSongs,
                          reverse: false,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SafeArea(
                            child: AlbumToSongsButton(
                                onPressed: _onShowSongsPressed),
                          ),
                        )._animatePageY(
                            context: context,
                            forward: _showAlbumSongs,
                            reverse: false),
                        if (_currentAlbum != null)
                          SongsScreen(album: _currentAlbum!)._animatePageY(
                            context: context,
                            forward: _showAlbumSongs,
                            reverse: true,
                          ),
                      ],
                    ),
                  ),
            error: (error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
              ),
            ),
          ),
    );
  }
}

extension VerticalMoveAnimate on Widget {
  Animate _animateFadeIn({
    required bool forward,
    required bool reverse,
  }) {
    return animate(
      autoPlay: false,
      target: forward ? 1 : 0,
    ).fade(
      begin: reverse ? 1 : 0,
      end: reverse ? 0 : 1,
      duration: 1.seconds,
      curve: Curves.easeInOut,
    );
  }

  Animate _animateFadeOut({
    required bool forward,
    required bool reverse,
  }) {
    return animate(
      autoPlay: false,
      target: forward ? 1 : 0,
    ).fade(
      begin: reverse ? 0 : 1,
      end: reverse ? 1 : 0,
      duration: 1.seconds,
      curve: Curves.easeInOut,
    );
  }

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
