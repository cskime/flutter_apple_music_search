import 'dart:convert';

import 'package:apple_music_search/network/itunes_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

final itunesApiProvider = Provider(
  (ref) => ItunesApi(),
);

class ItunesApi {
  Uri _makeUri({
    required String term,
    required ItunesApiSearchType searchType,
    required ItunesApiEntityType entityType,
  }) =>
      Uri.https(
        "itunes.apple.com",
        "/${searchType.name}",
        {
          "term": term,
          "country": "us",
          "media": "music",
          "entity": entityType.name,
          "attribute": "artistTerm",
        },
      );

  Future<ItunesResult> search({
    required String term,
    required ItunesApiEntityType entityType,
  }) async {
    final uri = _makeUri(
      term: term,
      searchType: ItunesApiSearchType.search,
      entityType: entityType,
    );
    final response = await get(uri);
    return ItunesResult.fromJson(jsonDecode(response.body));
  }
}

enum ItunesApiSearchType { search, lookup }

enum ItunesApiEntityType { musicArtist, album, song }
