// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itunes_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItunesResultImpl _$$ItunesResultImplFromJson(Map<String, dynamic> json) =>
    _$ItunesResultImpl(
      results: (json['results'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$ItunesResultImplToJson(_$ItunesResultImpl instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
