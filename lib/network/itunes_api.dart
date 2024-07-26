import 'dart:convert';

import 'package:apple_music_search/network/itunes_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

final itunesApiProvider = Provider(
  (ref) => ItunesApi(),
);

class ItunesApi {
  Uri _makeSearchUri({
    required String term,
    required ItunesApiEntityType entityType,
  }) =>
      Uri.https(
        "itunes.apple.com",
        "/search",
        {
          "term": term,
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
      term: term,
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
}

enum ItunesApiEntityType { musicArtist, album, song }
