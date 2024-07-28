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
      artistName: json['artistName'] as String,
      artworkUrl60: json['artworkUrl60'] as String,
      artworkUrl100: json['artworkUrl100'] as String,
      trackNumber: (json['trackNumber'] as num).toInt(),
      previewUrl: json['previewUrl'] as String,
      releaseDate: json['releaseDate'] as String,
      primaryGenreName: json['primaryGenreName'] as String,
      trackCount: (json['trackCount'] as num).toInt(),
      isStreamable: json['isStreamable'] as bool,
    );

Map<String, dynamic> _$$TrackModelImplToJson(_$TrackModelImpl instance) =>
    <String, dynamic>{
      'trackId': instance.trackId,
      'trackName': instance.trackName,
      'collectionName': instance.collectionName,
      'artistName': instance.artistName,
      'artworkUrl60': instance.artworkUrl60,
      'artworkUrl100': instance.artworkUrl100,
      'trackNumber': instance.trackNumber,
      'previewUrl': instance.previewUrl,
      'releaseDate': instance.releaseDate,
      'primaryGenreName': instance.primaryGenreName,
      'trackCount': instance.trackCount,
      'isStreamable': instance.isStreamable,
    };
