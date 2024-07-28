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
  late final _viewModelProvider = tracksViewModelProvider(widget.albumId);
  late final _viewModel = ref.read(_viewModelProvider.notifier);

  TrackModel? _selectedTrack;
  TrackModel? _playingTrack;
  Stream<double>? _audioProgress;

  bool _isSelectedTrack(TrackModel track) => _selectedTrack == track;
  bool _isPlayingTrack(TrackModel track) => _playingTrack == track;

  void _onTrackPlayPressed(TrackModel track) async {
    if (_isPlayingTrack(track)) {
      _viewModel.pauseAudio();
      setState(() {
        _playingTrack = null;
      });
      return;
    }

    if (!_isSelectedTrack(track)) {
      _viewModel.stopAudio();
    }

    _audioProgress = await _viewModel.playAudio(track.previewUrl);
    setState(() {
      if (!_isSelectedTrack(track)) {
        _selectedTrack = track;
      }
      _playingTrack = track;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(_viewModelProvider).when(
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
                        selected: _selectedTrack == track,
                        playing: _playingTrack == track,
                        progress:
                            _selectedTrack == track ? _audioProgress : null,
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
