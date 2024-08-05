import 'package:apple_music_search/layer/data/network/itunes_api.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../dummy/album_dummy.dart';
import '../../../dummy/artist_dummy.dart';
import '../../../dummy/song_dummy.dart';
import '../../../mocks/network_mock.dart';

void main() {
  group("ItunesApi send a request with", () {
    test("/search path when searching artists", () {
      // given
      final network = NetworkMock();
      network.output = artistDummyResponseString;
      final itunesApi = ItunesApiImpl(network: network);

      // when
      itunesApi.searchArtists(query: "taylor");

      // then
      final expected = Uri.parse(
          "https://itunes.apple.com/search?term=taylor&country=us&media=music&entity=musicArtist&attribute=artistTerm");
      expect(network.requestUrl, expected);
    });

    test("/lookup path when searching albums", () {
      // given
      const artistId = 159260351;
      final network = NetworkMock();
      network.output = albumDummyResponseString(artistId);
      final itunesApi = ItunesApiImpl(network: network);

      // when
      itunesApi.fetchAlbums(artistId: artistId);

      // then
      final expected = Uri.parse(
          "https://itunes.apple.com/lookup?id=$artistId&country=us&entity=album");
      expect(network.requestUrl, expected);
    });

    test("/lookup path when searching songs", () {
      // given
      const collectionId = 1468058165;
      final network = NetworkMock();
      network.output = songDummyResponseString(collectionId);
      final itunesApi = ItunesApiImpl(network: network);

      // when
      itunesApi.fetchSongs(albumId: collectionId);

      // then
      final expected = Uri.parse(
          "https://itunes.apple.com/lookup?id=$collectionId&country=us&entity=song");
      expect(network.requestUrl, expected);
    });
  });
}
