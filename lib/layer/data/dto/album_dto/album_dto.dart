import 'package:apple_music_search/layer/domain/entity/album/album.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'album_dto.freezed.dart';
part 'album_dto.g.dart';

@freezed
class AlbumDto with _$AlbumDto {
  factory AlbumDto({
    required int collectionId,
    required String artistName,
    required String collectionName,
    required String artworkUrl100,
    required int trackCount,
    required String releaseDate,
    required String primaryGenreName,
  }) = _AlbumDto;

  factory AlbumDto.fromJson(Map<String, dynamic> json) =>
      _$AlbumDtoFromJson(json);
}

extension AlbumDtoToEntity on AlbumDto {
  Album toEntity() => Album(
        id: collectionId,
        title: collectionName,
        artistName: artistName,
        coverImageUrl: artworkUrl100,
        numberOfSongs: trackCount,
        releaseDate: releaseDate,
        primaryGenreName: primaryGenreName,
      );
}
