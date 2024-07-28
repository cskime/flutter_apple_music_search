import 'package:freezed_annotation/freezed_annotation.dart';

part 'track_model.freezed.dart';
part 'track_model.g.dart';

@freezed
class TrackModel with _$TrackModel {
  factory TrackModel({
    required int trackId,
    required String trackName,
    required String collectionName,
    required String artistName,
    required String artworkUrl60,
    required String artworkUrl100,
    required int trackNumber,
    required String previewUrl,
    required String releaseDate,
    required String primaryGenreName,
    required int trackCount,
    required bool isStreamable,
  }) = _TrackModel;

  factory TrackModel.fromJson(Map<String, dynamic> json) =>
      _$TrackModelFromJson(json);
}
