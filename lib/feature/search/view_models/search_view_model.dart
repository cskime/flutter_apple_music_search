import 'dart:async';

import 'package:apple_music_search/feature/search/models/artist/artist_model.dart';
import 'package:apple_music_search/network/itunes_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchViewModelProvider =
    AsyncNotifierProvider<SearchViewModel, List<ArtistModel>>(
        SearchViewModel.new);

class SearchViewModel extends AsyncNotifier<List<ArtistModel>> {
  late final ItunesApi api;

  @override
  FutureOr<List<ArtistModel>> build() {
    api = ref.read(itunesApiProvider);
    return [];
  }

  Future<void> search({required String term}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final result = await api.search(
        term: term,
        entityType: ItunesApiEntityType.musicArtist,
      );
      return result.results.map((json) => ArtistModel.fromJson(json)).toList();
    });
  }
}
