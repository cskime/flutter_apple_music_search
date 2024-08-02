import 'package:apple_music_search/layer/presentation/utils/release_date_formatter.dart';
import 'package:apple_music_search/layer/domain/entity/album/album.dart';
import 'package:apple_music_search/layer/domain/entity/song/song.dart';
import 'package:apple_music_search/layer/domain/repository/album_repository.dart';

abstract class FetchAlbumUseCase {
  Future<List<Album>> fetchAlbums({required int artistId});
  Future<List<Song>> fetchSongs({required int albumId});
}

class FetchAlbumUseCaseImpl extends FetchAlbumUseCase {
  FetchAlbumUseCaseImpl({
    required this.albumRepository,
  });

  final AlbumRepository albumRepository;

  int _sortForYear(Album a, Album b) {
    final formatter = ReleaseDateFormatter();
    final date1 = formatter.dateTime(a.releaseDate);
    final date2 = formatter.dateTime(b.releaseDate);
    return date2.compareTo(date1);
  }

  @override
  Future<List<Album>> fetchAlbums({required int artistId}) async {
    final albums = await albumRepository.fetchAlbums(artistId: artistId);
    return albums..sort(_sortForYear);
  }

  @override
  Future<List<Song>> fetchSongs({required int albumId}) async {
    final songs = await albumRepository.fetchSongs(albumId: albumId);
    return songs;
  }
}
