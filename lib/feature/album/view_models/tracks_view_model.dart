import 'dart:async';

import 'package:apple_music_search/feature/album/models/track_model/track_model.dart';
import 'package:apple_music_search/network/itunes_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tracksViewModelProvider = AsyncNotifierProvider.family
    .autoDispose<AlbumsViewModel, List<TrackModel>, int>(AlbumsViewModel.new);

class AlbumsViewModel
    extends AutoDisposeFamilyAsyncNotifier<List<TrackModel>, int> {
  late final ItunesApi api;

  @override
  FutureOr<List<TrackModel>> build(int arg) async {
    api = ref.read(itunesApiProvider);
    final result = await api.lookup(
      id: arg,
      entityType: ItunesApiEntityType.song,
    );
    return result.results
        .where((json) => json["wrapperType"] == "track")
        .map((json) => TrackModel.fromJson(json))
        .toList();
  }
}
