import 'dart:async';

import 'package:apple_music_search/layer/domain/entity/song/song.dart';
import 'package:apple_music_search/layer/domain/usecase/fetch_album_use_case.dart';
import 'package:apple_music_search/layer/presentation/provider/album_providers.dart';
import 'package:apple_music_search/layer/presentation/utils/sample_audio_player.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final songsViewModelProvider = AsyncNotifierProvider.family
    .autoDispose<SongsViewModel, List<Song>, int>(SongsViewModel.new);

class SongsViewModel extends AutoDisposeFamilyAsyncNotifier<List<Song>, int> {
  late final FetchAlbumUseCase _fetchAlbumUseCase;
  late final SampleAudioPlayer _audioService;

  @override
  FutureOr<List<Song>> build(int arg) async {
    _audioService = SampleAudioPlayer();
    ref.onDispose(_audioService.dispose);

    _fetchAlbumUseCase = ref.read(fetchAlbumUseCaseProvider);
    return await _fetchAlbumUseCase.fetchSongs(albumId: arg);
  }

  Future<Stream<double>> playAudio(String url) async {
    return await _audioService.play(url);
  }

  void pauseAudio() {
    _audioService.pause();
  }

  void stopAudio() {
    _audioService.stop();
  }
}
