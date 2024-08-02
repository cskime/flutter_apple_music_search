import 'dart:convert';

import 'package:apple_music_search/layer/data/dto/album_dto/album_dto.dart';
import 'package:apple_music_search/layer/data/dto/song_dto/song_dto.dart';
import 'package:http/http.dart';

import '../dto/artist_dto/artist_dto.dart';
import 'itunes_result.dart';

abstract class ItunesApi {
  Future<List<ArtistDto>> searchArtists({required String query});
  Future<List<AlbumDto>> fetchAlbums({required int artistId});
  Future<List<SongDto>> fetchSongs({required int albumId});
}

class ItunesApiImpl extends ItunesApi {
  Uri _makeSearchUri({
    required String query,
    required ItunesApiEntityType entityType,
  }) =>
      Uri.https(
        "itunes.apple.com",
        "/search",
        {
          "term": query,
          "country": "us",
          "media": "music",
          "entity": entityType.name,
          "attribute": "artistTerm",
        },
      );

  Uri _makeLookupUri({
    required int id,
    required ItunesApiEntityType entityType,
  }) =>
      Uri.https(
        "itunes.apple.com",
        "/lookup",
        {
          "id": "$id",
          "country": "us",
          "entity": entityType.name,
        },
      );

  @override
  Future<List<ArtistDto>> searchArtists({required String query}) async {
    final uri = _makeSearchUri(
      query: query,
      entityType: ItunesApiEntityType.musicArtist,
    );
    final response = await get(uri);
    final result = ItunesResult.fromJson(jsonDecode(response.body));
    return result.results.map((json) => ArtistDto.fromJson(json)).toList();
  }

  @override
  Future<List<AlbumDto>> fetchAlbums({required int artistId}) async {
    final uri = _makeLookupUri(
      id: artistId,
      entityType: ItunesApiEntityType.album,
    );
    final response = await get(uri);
    final result = ItunesResult.fromJson(jsonDecode(response.body));
    return result.results
        .where((json) => json["wrapperType"] == "collection")
        .map((json) => AlbumDto.fromJson(json))
        .toList();
  }

  @override
  Future<List<SongDto>> fetchSongs({required int albumId}) async {
    final uri = _makeLookupUri(
      id: albumId,
      entityType: ItunesApiEntityType.song,
    );
    final response = await get(uri);
    final result = ItunesResult.fromJson(jsonDecode(response.body));
    return result.results
        .where((json) => json["kind"] == "song")
        .map((json) => SongDto.fromJson(json))
        .toList();
  }
}

enum ItunesApiEntityType { musicArtist, album, song }
