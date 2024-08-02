import 'package:apple_music_search/layer/data/repository/album_repository_impl.dart';
import 'package:apple_music_search/layer/domain/repository/album_repository.dart';
import 'package:apple_music_search/layer/domain/usecase/fetch_album_use_case.dart';
import 'package:apple_music_search/layer/presentation/provider/itunes_api_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final albumRepositoryProvider = Provider<AlbumRepository>(
  (ref) => AlbumRepositoryImpl(
    itunesApi: ref.read(itunesApiProvider),
  ),
);

final fetchAlbumUseCaseProvider = Provider<FetchAlbumUseCase>(
  (ref) => FetchAlbumUseCaseImpl(
    albumRepository: ref.read(albumRepositoryProvider),
  ),
);
