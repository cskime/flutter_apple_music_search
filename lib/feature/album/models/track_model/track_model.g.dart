// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrackModelImpl _$$TrackModelImplFromJson(Map<String, dynamic> json) =>
    _$TrackModelImpl(
      trackId: (json['trackId'] as num).toInt(),
      trackName: json['trackName'] as String,
      collectionName: json['collectionName'] as String,
      artworkUrl60: json['artworkUrl60'] as String,
      artworkUrl100: json['artworkUrl100'] as String,
      trackNumber: (json['trackNumber'] as num).toInt(),
      releaseDate: json['releaseDate'] as String,
      trackCount: (json['trackCount'] as num).toInt(),
      isStreamable: json['isStreamable'] as bool,
    );

Map<String, dynamic> _$$TrackModelImplToJson(_$TrackModelImpl instance) =>
    <String, dynamic>{
      'trackId': instance.trackId,
      'trackName': instance.trackName,
      'collectionName': instance.collectionName,
      'artworkUrl60': instance.artworkUrl60,
      'artworkUrl100': instance.artworkUrl100,
      'trackNumber': instance.trackNumber,
      'releaseDate': instance.releaseDate,
      'trackCount': instance.trackCount,
      'isStreamable': instance.isStreamable,
    };
