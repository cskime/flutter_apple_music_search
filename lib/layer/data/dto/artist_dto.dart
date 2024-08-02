import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/artist.dart';

part 'artist_dto.freezed.dart';
part 'artist_dto.g.dart';

@freezed
class ArtistDto with _$ArtistDto {
  factory ArtistDto({
    required int artistId,
    required String artistType,
    required String artistName,
  }) = _ArtistDto;

  factory ArtistDto.fromJson(Map<String, dynamic> json) =>
      _$ArtistDtoFromJson(json);
}

extension ArtistDtoToEntity on ArtistDto {
  Artist toEntity() => Artist(
        id: artistId,
        name: artistName,
      );
}
