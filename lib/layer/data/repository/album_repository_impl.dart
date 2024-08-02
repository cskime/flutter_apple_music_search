import 'package:apple_music_search/layer/data/dto/album_dto/album_dto.dart';
import 'package:apple_music_search/layer/data/dto/song_dto/song_dto.dart';
import 'package:apple_music_search/layer/data/network/itunes_api.dart';
import 'package:apple_music_search/layer/domain/entity/album/album.dart';
import 'package:apple_music_search/layer/domain/entity/song/song.dart';
import 'package:apple_music_search/layer/domain/repository/album_repository.dart';

class AlbumRepositoryImpl extends AlbumRepository {
  final ItunesApi itunesApi;

  AlbumRepositoryImpl({
    required this.itunesApi,
  });

  @override
  Future<List<Album>> fetchAlbums({required int artistId}) async {
    final dtos = await itunesApi.fetchAlbums(artistId: artistId);
    return dtos.map((dto) => dto.toEntity()).toList();
  }

  @override
  Future<List<Song>> fetchSongs({required int albumId}) async {
    final dtos = await itunesApi.fetchSongs(albumId: albumId);
    return dtos.map((dto) => dto.toEntity()).toList();
  }
}
