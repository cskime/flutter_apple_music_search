import 'dart:async';

import 'package:apple_music_search/layer/domain/entity/artist/artist.dart';
import 'package:apple_music_search/layer/domain/usecase/search_artist_use_case.dart';
import 'package:flutter/material.dart';

class SearchViewModel extends ChangeNotifier {
  SearchViewModel({
    required this.searchArtistUseCase,
  });

  final SearchArtistUseCase searchArtistUseCase;

  var artists = <Artist>[];
  var isLoading = false;

  Future<void> searchArtists({required String query}) async {
    isLoading = true;
    notifyListeners();

    artists = await searchArtistUseCase.search(query: query);
    isLoading = false;
    notifyListeners();
  }
}
