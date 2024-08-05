import 'dart:convert';

import 'package:apple_music_search/layer/data/dto/album_dto/album_dto.dart';
import 'package:apple_music_search/layer/data/dto/artist_dto/artist_dto.dart';
import 'package:apple_music_search/layer/data/dto/song_dto/song_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../dummy/album_dummy.dart';
import '../../../dummy/artist_dummy.dart';
import '../../../dummy/song_dummy.dart';

void main() {
  test("ArtistDto class can parse a JSON response", () {
    // given
    const artistId = 159260351;
    final json = jsonDecode(artistDummyJsonString(artistId));

    // when
    final artist = ArtistDto.fromJson(json);

    // then
    expect(artist.artistId, artistId);
  });

  test("AlbumDto class can parse a JSON response", () {
    // given
    const collectionId = 1468058165;
    final json = jsonDecode(albumDummyJsonString(collectionId));

    // when
    final album = AlbumDto.fromJson(json);

    // then
    expect(album.collectionId, collectionId);
  });

  test("SongDto class can parse a JSON response", () {
    // given
    const trackId = 1468058169;
    final json = jsonDecode(songDummyJsonString(trackId));

    // when
    final album = SongDto.fromJson(json);

    // then
    expect(album.trackId, trackId);
  });
}
