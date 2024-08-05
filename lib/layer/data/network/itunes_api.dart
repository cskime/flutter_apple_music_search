import 'dart:convert';

import 'package:apple_music_search/layer/data/dto/album_dto/album_dto.dart';
import 'package:apple_music_search/layer/data/dto/song_dto/song_dto.dart';
import 'package:apple_music_search/layer/data/network/base/network.dart';
import 'package:apple_music_search/layer/data/network/base/request.dart';

import '../dto/artist_dto/artist_dto.dart';
import 'itunes_result.dart';

abstract class ItunesApi {
  Future<List<ArtistDto>> searchArtists({required String query});
  Future<List<AlbumDto>> fetchAlbums({required int artistId});
  Future<List<SongDto>> fetchSongs({required int albumId});
}

class ItunesApiImpl extends ItunesApi {
  ItunesApiImpl({
    required this.network,
  });

  final Network network;

  @override
  Future<List<ArtistDto>> searchArtists({required String query}) async {
    final request = _makeSearchRequest(
      query: query,
      entityType: ItunesApiEntityType.musicArtist,
    );
    final response = await network.send(request);
    final result = ItunesResult.fromJson(jsonDecode(response.output));
    return result.results.map((json) => ArtistDto.fromJson(json)).toList();
  }

  @override
  Future<List<AlbumDto>> fetchAlbums({required int artistId}) async {
    final request = _makeLookupRequest(
      id: artistId,
      entityType: ItunesApiEntityType.album,
    );
    final response = await network.send(request);
    final result = ItunesResult.fromJson(jsonDecode(response.output));
    return result.results
        .where((json) => json["wrapperType"] == "collection")
        .map((json) => AlbumDto.fromJson(json))
        .toList();
  }

  @override
  Future<List<SongDto>> fetchSongs({required int albumId}) async {
    final request = _makeLookupRequest(
      id: albumId,
      entityType: ItunesApiEntityType.song,
    );
    final response = await network.send(request);
    final result = ItunesResult.fromJson(jsonDecode(response.output));
    return result.results
        .where((json) => json["kind"] == "song")
        .map((json) => SongDto.fromJson(json))
        .toList();
  }

  Request _makeSearchRequest({
    required String query,
    required ItunesApiEntityType entityType,
  }) =>
      Request(
        endpoint: "itunes.apple.com",
        path: "search",
        query: {
          "term": query,
          "country": "us",
          "media": "music",
          "entity": entityType.name,
          "attribute": "artistTerm",
        },
      );

  Request _makeLookupRequest({
    required int id,
    required ItunesApiEntityType entityType,
  }) =>
      Request(
        endpoint: "itunes.apple.com",
        path: "lookup",
        query: {
          "id": "$id",
          "country": "us",
          "entity": entityType.name,
        },
      );
}

enum ItunesApiEntityType { musicArtist, album, song }
