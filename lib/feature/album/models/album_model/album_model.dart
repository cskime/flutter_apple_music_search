import 'package:freezed_annotation/freezed_annotation.dart';

part 'album_model.freezed.dart';
part 'album_model.g.dart';

@freezed
class AlbumModel with _$AlbumModel {
  factory AlbumModel({
    required int collectionId,
    required String collectionName,
    required String artworkUrl100,
    required String releaseDate,
    required String primaryGenreName,
  }) = _AlbumModel;

  factory AlbumModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumModelFromJson(json);
}
