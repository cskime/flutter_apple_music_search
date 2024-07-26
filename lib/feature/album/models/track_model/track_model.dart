import 'package:freezed_annotation/freezed_annotation.dart';

part 'track_model.freezed.dart';
part 'track_model.g.dart';

@freezed
class TrackModel with _$TrackModel {
  factory TrackModel({
    required int trackId,
    required String trackName,
    required String artworkUrl60,
    required int trackNumber,
    required String releaseDate,
    required bool isStreamable,
  }) = _TrackModel;

  factory TrackModel.fromJson(Map<String, dynamic> json) =>
      _$TrackModelFromJson(json);
}
