import 'package:apple_music_search/layer/data/network/itunes_api.dart';
import 'package:apple_music_search/layer/data/repository/artist_repository_impl.dart';
import 'package:apple_music_search/layer/domain/usecase/search_artist_use_case.dart';
import 'package:apple_music_search/layer/presentation/theme/light_theme_data.dart';
import 'package:apple_music_search/layer/presentation/view/search/search_screen.dart';
import 'package:apple_music_search/layer/presentation/view_model/search/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: AppleMusicSearchApp(),
    ),
  );
}

class AppleMusicSearchApp extends StatefulWidget {
  const AppleMusicSearchApp({super.key});

  @override
  State<AppleMusicSearchApp> createState() => _AppleMusicSearchAppState();
}

class _AppleMusicSearchAppState extends State<AppleMusicSearchApp> {
  late final SearchViewModel _searchViewModel;

  @override
  void initState() {
    super.initState();

    final iTunesApi = ItunesApiImpl();
    final artistRepository = ArtistRepositoryImpl(
      itunesApi: iTunesApi,
    );
    final searchArtistUseCase = SearchArtistUseCaseImpl(
      artistRepository: artistRepository,
    );
    _searchViewModel = SearchViewModel(
      searchArtistUseCase: searchArtistUseCase,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AppleMusicSearchApp",
      theme: lightThemeData,
      home: SearchScreen(
        viewModel: _searchViewModel,
      ),
    );
  }
}
