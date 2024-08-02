import 'package:freezed_annotation/freezed_annotation.dart';

part 'artist.freezed.dart';

@freezed
class Artist with _$Artist {
  factory Artist({
    required int id,
    required String name,
  }) = _Artist;
}
