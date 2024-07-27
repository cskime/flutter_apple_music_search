import 'package:apple_music_search/feature/album/models/track_model/track_model.dart';
import 'package:apple_music_search/feature/album/view_models/tracks_view_model.dart';
import 'package:apple_music_search/feature/album/views/widgets/track_list_header.dart';
import 'package:apple_music_search/feature/album/views/widgets/track_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TracksScreen extends ConsumerStatefulWidget {
  const TracksScreen({
    super.key,
    required this.albumId,
    required this.onShowAlbumPressed,
  });

  final int albumId;
  final void Function() onShowAlbumPressed;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TracksScreenState();
}

class _TracksScreenState extends ConsumerState<TracksScreen> {
  TrackModel? _currentPlayingTrack;

  void _onTrackPlayPressed(TrackModel track) {
    setState(() {
      _currentPlayingTrack = track;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(tracksViewModelProvider(widget.albumId)).when(
          data: (data) => SafeArea(
            bottom: false,
            child: Column(
              children: [
                TrackListHeader(track: data.first),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final track = data[index];
                      return TrackListItem(
                        track: track,
                        playing: _currentPlayingTrack == track,
                        onPlayPressed: _onTrackPlayPressed,
                      );
                    },
                  ),
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
        );
  }
}
