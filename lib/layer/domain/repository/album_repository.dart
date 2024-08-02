import 'package:apple_music_search/layer/domain/entity/album/album.dart';

abstract class AlbumRepository {
  Future<List<Album>> fetchAlbums({required int artistId});
}
