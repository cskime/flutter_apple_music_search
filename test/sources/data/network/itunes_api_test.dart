import 'package:apple_music_search/layer/data/network/itunes_api.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../dummy/album_dummy.dart';
import '../../../dummy/artist_dummy.dart';
import '../../../dummy/song_dummy.dart';
import '../../../mocks/network_mock.dart';

void main() {
  late NetworkMock network;
  late ItunesApiImpl itunesApi;
  String artistQuery = "taylor";
  const artistId = 159260351;
  const collectionId = 1468058165;

  setUp(() {
    network = NetworkMock();
    itunesApi = ItunesApiImpl(network: network);
  });

  group("ItunesApi send a request with", () {
    test("/search path when searching artists", () {
      // given
      network.output = artistDummyResponseString;

      // when
      itunesApi.searchArtists(query: artistQuery);

      // then
      final expected = Uri.parse(
          "https://itunes.apple.com/search?term=$artistQuery&country=us&media=music&entity=musicArtist&attribute=artistTerm");
      expect(network.requestUrl, expected);
    });

    test("/lookup path when searching albums", () {
      // given
      network.output = albumDummyResponseString(artistId);

      // when
      itunesApi.fetchAlbums(artistId: artistId);

      // then
      final expected = Uri.parse(
          "https://itunes.apple.com/lookup?id=$artistId&country=us&entity=album");
      expect(network.requestUrl, expected);
    });

    test("/lookup path when searching songs", () {
      // given
      network.output = songDummyResponseString(collectionId);

      // when
      itunesApi.fetchSongs(albumId: collectionId);

      // then
      final expected = Uri.parse(
          "https://itunes.apple.com/lookup?id=$collectionId&country=us&entity=song");
      expect(network.requestUrl, expected);
    });
  });

  group("ItunesApi gets results:", () {
    test("gets artists", () async {
      // given
      network.output = artistDummyResponseString;

      // when
      final artists = await itunesApi.searchArtists(query: artistQuery);

      // then
      expect(artists.length, 3);
      expect(
        artists.where(
          (artist) => artist.artistName.toLowerCase().contains(artistQuery),
        ),
        isNotEmpty,
      );
    });

    test("gets albums", () async {
      // given
      network.output = albumDummyResponseString(artistId);

      // when
      final albums = await itunesApi.fetchAlbums(artistId: artistId);

      // then
      expect(albums.length, 3);
    });

    test("gets songs", () async {
      // given
      network.output = songDummyResponseString(collectionId);

      // when
      final songs = await itunesApi.fetchSongs(albumId: collectionId);

      // then
      expect(songs.length, 3);
    });
  });
}
