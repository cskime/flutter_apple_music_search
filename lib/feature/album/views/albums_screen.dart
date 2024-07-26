import 'dart:ui';

import 'package:apple_music_search/feature/album/view_models/albums_view_model.dart';
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
  final _pageController = PageController(
    viewportFraction: 0.7,
  );

  int _currentPageIndex = 0;
  final _scaleOffset = ValueNotifier<double>(0);

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        surfaceTintColor: Colors.white.withOpacity(0),
        foregroundColor: Colors.white,
      ),
      body: ref.watch(albumsViewModelProvider(widget.artist.artistId)).when(
            data: (data) => data.isEmpty
                ? const Center(
                    child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("No Albums founded"),
                    ],
                  ))
                : Stack(
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
                                final difference = (value - index).abs() * 0.2;
                                final scale = 1 - difference;
                                return Transform.scale(
                                  scale: scale,
                                  child: AlbumCover(
                                    coverUrlString: album.artworkUrl100,
                                    albumName: album.collectionName,
                                    releaseYear:
                                        album.releaseDate.split("-").first,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        onPageChanged: _onPageChanged,
                      ),
                    ],
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
