import 'dart:async';

import 'package:apple_music_search/feature/album/models/album_model/album_model.dart';
import 'package:apple_music_search/feature/album/services/release_date_formatter.dart';
import 'package:apple_music_search/network/itunes_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final albumsViewModelProvider = AsyncNotifierProvider.family
    .autoDispose<AlbumsViewModel, List<AlbumModel>, int>(AlbumsViewModel.new);

class AlbumsViewModel
    extends AutoDisposeFamilyAsyncNotifier<List<AlbumModel>, int> {
  late final ItunesApi _api;

  int _sortForYear(AlbumModel a, AlbumModel b) {
    final formatter = ReleaseDateFormatter();
    final date1 = formatter.dateTime(a.releaseDate);
    final date2 = formatter.dateTime(b.releaseDate);
    return date2.compareTo(date1);
  }

  @override
  FutureOr<List<AlbumModel>> build(int arg) async {
    _api = ref.read(itunesApiProvider);
    return _api.lookup(id: arg, entityType: ItunesApiEntityType.album).then(
      (value) {
        return value.results
            .where((json) => json["wrapperType"] == "collection")
            .map((json) => AlbumModel.fromJson(json))
            .toList()
          ..sort(_sortForYear);
      },
    );
  }

  int? albumIdAtIndex(int index) {
    return state.value?[index].collectionId;
  }
}
