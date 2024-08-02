import 'package:freezed_annotation/freezed_annotation.dart';

part 'song.freezed.dart';

@freezed
class Song with _$Song {
  factory Song({
    required int id,
    required String title,
    required String albumName,
    required String artistName,
    required String albumCoverImageUrl,
    required int number,
    required String previewUrl,
    required String releaseDate,
    required String primaryGenreName,
    required bool isStreamable,
  }) = _Song;
}
