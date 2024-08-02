import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import '../dto/artist_dto.dart';

import 'itunes_result.dart';

final itunesApiProvider = Provider(
  (ref) => ItunesApiImpl(),
);

abstract class ItunesApi {
  Future<List<ArtistDto>> searchArtists({required String query});
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

  Future<ItunesResult> search({
    required String term,
    required ItunesApiEntityType entityType,
  }) async {
    final uri = _makeSearchUri(
      query: term,
      entityType: entityType,
    );
    final response = await get(uri);
    return ItunesResult.fromJson(jsonDecode(response.body));
  }

  Future<ItunesResult> lookup({
    required int id,
    required ItunesApiEntityType entityType,
  }) async {
    final uri = _makeLookupUri(id: id, entityType: entityType);
    final response = await get(uri);
    return ItunesResult.fromJson(jsonDecode(response.body));
  }

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
}

enum ItunesApiEntityType { musicArtist, album, song }
