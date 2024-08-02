import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entity/artist.dart';
import '../../domain/usecase/search_artist_use_case.dart';
import '../providers.dart';

final searchViewModelProvider =
    AsyncNotifierProvider<SearchViewModel, List<Artist>>(SearchViewModel.new);

class SearchViewModel extends AsyncNotifier<List<Artist>> {
  late final SearchArtistUseCase searchArtistUseCase;

  @override
  FutureOr<List<Artist>> build() {
    searchArtistUseCase = ref.read(searchArtistUseCaseProvider);
    return [];
  }

  Future<void> search({required String term}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await searchArtistUseCase.search(query: term);
    });
  }
}
