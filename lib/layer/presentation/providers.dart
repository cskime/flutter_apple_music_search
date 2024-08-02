import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/network/itunes_api.dart';
import '../data/repository/artist_repository_impl.dart';
import '../domain/repository/artist_repository.dart';
import '../domain/usecase/search_artist_use_case.dart';

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

final itunesApiProvider = Provider<ItunesApi>(
  (ref) => ItunesApiImpl(),
);
