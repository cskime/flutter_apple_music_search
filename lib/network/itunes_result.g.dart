// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itunes_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItunesResultImpl _$$ItunesResultImplFromJson(Map<String, dynamic> json) =>
    _$ItunesResultImpl(
      resultCount: (json['resultCount'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$ItunesResultImplToJson(_$ItunesResultImpl instance) =>
    <String, dynamic>{
      'resultCount': instance.resultCount,
      'results': instance.results,
    };
