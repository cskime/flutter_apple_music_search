import 'dart:async';

import 'package:apple_music_search/feature/album/models/album_model.dart';
import 'package:apple_music_search/network/itunes_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final albumsViewModelProvider = AsyncNotifierProvider.family
    .autoDispose<AlbumsViewModel, List<AlbumModel>, int>(AlbumsViewModel.new);

class AlbumsViewModel
    extends AutoDisposeFamilyAsyncNotifier<List<AlbumModel>, int> {
  late final ItunesApi api;

  @override
  FutureOr<List<AlbumModel>> build(int arg) async {
    final api = ref.read(itunesApiProvider);
    final result = await api.lookup(
      id: arg,
      entityType: ItunesApiEntityType.album,
    );
    return result.results
        .where((json) => json["wrapperType"] == "collection")
        .map((json) => AlbumModel.fromJson(json))
        .toList();
  }
}
