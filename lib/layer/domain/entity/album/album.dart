import 'package:freezed_annotation/freezed_annotation.dart';

part 'album.freezed.dart';

@freezed
class Album with _$Album {
  factory Album({
    required int id,
    required String title,
    required String coverImageUrl,
    required String releaseDate,
    required String primaryGenreName,
  }) = _Album;
}
