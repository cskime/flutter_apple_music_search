import 'package:apple_music_search/layer/domain/entity/album/album.dart';
import 'package:apple_music_search/layer/domain/entity/song/song.dart';
import 'package:apple_music_search/layer/presentation/view/album/widgets/song/song_list_item.dart';
import 'package:apple_music_search/layer/presentation/view/album/widgets/song/songs_list_header.dart';
import 'package:apple_music_search/layer/presentation/view_model/song/songs_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SongsScreen extends ConsumerStatefulWidget {
  const SongsScreen({
    super.key,
    required this.album,
  });

  final Album album;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SongsScreenState();
}

class _SongsScreenState extends ConsumerState<SongsScreen> {
  Song? _selectedSong;
  Song? _playingSong;
  Stream<double>? _audioProgress;

  bool _isSelectedSong(Song song) => _selectedSong == song;
  bool _isPlayingSong(Song song) => _playingSong == song;

  void _onSongPlayPressed(Song song) async {
    final viewModel = ref.read(
      songsViewModelProvider(widget.album.id).notifier,
    );
    if (_isPlayingSong(song)) {
      viewModel.pauseAudio();
      setState(() {
        _playingSong = null;
      });
      return;
    }

    if (!_isSelectedSong(song)) {
      viewModel.stopAudio();
    }

    _audioProgress = await viewModel.playAudio(song.previewUrl);
    setState(() {
      if (!_isSelectedSong(song)) {
        _selectedSong = song;
      }
      _playingSong = song;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(songsViewModelProvider(widget.album.id)).when(
          data: (data) => SafeArea(
            bottom: false,
            child: Column(
              children: [
                SongsListHeader(album: widget.album),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final song = data[index];
                      return SongListItem(
                        song: song,
                        selected: _selectedSong == song,
                        playing: _playingSong == song,
                        progress:
                            _selectedSong == song ? _audioProgress : null,
                        onPlayPressed: _onSongPlayPressed,
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
            child: CircularProgressIndicator.adaptive(
              backgroundColor: Colors.white,
            ),
          ),
        );
  }
}
