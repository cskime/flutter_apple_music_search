import 'package:apple_music_search/layer/domain/entity/song/song.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'song_dto.freezed.dart';
part 'song_dto.g.dart';

@freezed
class SongDto with _$SongDto {
  factory SongDto({
    required int trackId,
    required String trackName,
    required String collectionName,
    required String artistName,
    required String artworkUrl60,
    required int trackNumber,
    required String previewUrl,
    required String releaseDate,
    required String primaryGenreName,
    required bool isStreamable,
  }) = _SongDto;

  factory SongDto.fromJson(Map<String, dynamic> json) =>
      _$SongDtoFromJson(json);
}

extension SongDtoToEntity on SongDto {
  Song toEntity() => Song(
        id: trackId,
        title: trackName,
        albumName: collectionName,
        artistName: artistName,
        albumCoverImageUrl: artworkUrl60,
        number: trackNumber,
        previewUrl: previewUrl,
        releaseDate: releaseDate,
        primaryGenreName: primaryGenreName,
        isStreamable: isStreamable,
      );
}
