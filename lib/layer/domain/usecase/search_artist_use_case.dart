import '../entity/artist/artist.dart';
import '../repository/artist_repository.dart';

abstract class SearchArtistUseCase {
  Future<List<Artist>> search({required String query});
}

class SearchArtistUseCaseImpl extends SearchArtistUseCase {
  final ArtistRepository artistRepository;

  SearchArtistUseCaseImpl({
    required this.artistRepository,
  });

  @override
  Future<List<Artist>> search({required String query}) async {
    return await artistRepository.searchArtists(query: query);
  }
}
