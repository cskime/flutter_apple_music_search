import 'package:apple_music_search/layer/data/repository/artist_repository_impl.dart';
import 'package:apple_music_search/layer/domain/repository/artist_repository.dart';
import 'package:apple_music_search/layer/domain/usecase/search_artist_use_case.dart';
import 'package:apple_music_search/layer/presentation/provider/itunes_api_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchArtistUseCaseProvider = Provider<SearchArtistUseCase>(
  (ref) => SearchArtistUseCaseImpl(
    artistRepository: ref.read(artistRepositoryProvider),
  ),
);

final artistRepositoryProvider = Provider<ArtistRepository>(
  (ref) => ArtistRepositoryImpl(
    itunesApi: ref.read(itunesApiProvider),
  ),
);
