import 'package:freezed_annotation/freezed_annotation.dart';

part 'artist_model.freezed.dart';
part 'artist_model.g.dart';

@freezed
class ArtistModel with _$ArtistModel {
  factory ArtistModel({
    required int artistId,
    required String artistType,
    required String artistName,
  }) = _ArtistModel;

  factory ArtistModel.fromJson(Map<String, dynamic> json) =>
      _$ArtistModelFromJson(json);
}
