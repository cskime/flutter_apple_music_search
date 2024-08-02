import 'dart:async';

import 'package:apple_music_search/layer/domain/entity/album/album.dart';
import 'package:apple_music_search/layer/domain/usecase/fetch_album_use_case.dart';
import 'package:apple_music_search/layer/presentation/provider/album_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final albumsViewModelProvider = AsyncNotifierProvider.family
    .autoDispose<AlbumsViewModel, List<Album>, int>(AlbumsViewModel.new);

class AlbumsViewModel extends AutoDisposeFamilyAsyncNotifier<List<Album>, int> {
  late final FetchAlbumUseCase _fetchAlbumUseCase;

  @override
  FutureOr<List<Album>> build(int arg) async {
    _fetchAlbumUseCase = ref.read(fetchAlbumUseCaseProvider);
    return await _fetchAlbumUseCase.fetchAlbums(artistId: arg);
  }

  Album? albumAtIndex(int index) {
    return state.value?[index];
  }
}
