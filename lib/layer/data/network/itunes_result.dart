import 'package:freezed_annotation/freezed_annotation.dart';

part 'itunes_result.freezed.dart';
part 'itunes_result.g.dart';

@freezed
class ItunesResult with _$ItunesResult {
  factory ItunesResult({
    required List<Map<String, dynamic>> results,
  }) = _ItunesResult;

  factory ItunesResult.fromJson(Map<String, dynamic> json) =>
      _$ItunesResultFromJson(json);
}
