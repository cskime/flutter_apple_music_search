import '../entity/artist.dart';

abstract class ArtistRepository {
  Future<List<Artist>> searchArtists({required String query});
}
