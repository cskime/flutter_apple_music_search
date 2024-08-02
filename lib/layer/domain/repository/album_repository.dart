import 'package:apple_music_search/layer/domain/entity/album/album.dart';
import 'package:apple_music_search/layer/domain/entity/song/song.dart';

abstract class AlbumRepository {
  Future<List<Album>> fetchAlbums({required int artistId});
  Future<List<Song>> fetchSongs({required int albumId});
}
