import 'dart:async';

import 'package:apple_music_search/feature/album/models/track_model/track_model.dart';
import 'package:apple_music_search/feature/album/services/sample_audio_service.dart';
import 'package:apple_music_search/layer/data/network/itunes_api.dart';
import 'package:apple_music_search/layer/presentation/provider/itunes_api_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tracksViewModelProvider = AsyncNotifierProvider.family
    .autoDispose<AlbumsViewModel, List<TrackModel>, int>(AlbumsViewModel.new);

class AlbumsViewModel
    extends AutoDisposeFamilyAsyncNotifier<List<TrackModel>, int> {
  late final ItunesApi api;
  late final SampleAudioService _audioService;

  @override
  FutureOr<List<TrackModel>> build(int arg) async {
    api = ref.read(itunesApiProvider);
    _audioService = SampleAudioService();

    ref.onDispose(_audioService.dispose);

    final result = await api.lookup(
      id: arg,
      entityType: ItunesApiEntityType.song,
    );
    return result.results
        .where((json) => json["kind"] == "song")
        .map((json) => TrackModel.fromJson(json))
        .toList();
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
