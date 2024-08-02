import '../dto/artist_dto.dart';
import '../network/itunes_api.dart';
import '../../domain/entity/artist.dart';
import '../../domain/repository/artist_repository.dart';

class ArtistRepositoryImpl extends ArtistRepository {
  final ItunesApi itunesApi;

  ArtistRepositoryImpl({
    required this.itunesApi,
  });

  @override
  Future<List<Artist>> searchArtists({required String query}) async {
    final dtos = await itunesApi.searchArtists(query: query);
    return dtos.map((dto) => dto.toEntity()).toList();
  }
}
