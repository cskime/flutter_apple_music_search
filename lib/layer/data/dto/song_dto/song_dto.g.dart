// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongDtoImpl _$$SongDtoImplFromJson(Map<String, dynamic> json) =>
    _$SongDtoImpl(
      trackId: (json['trackId'] as num).toInt(),
      trackName: json['trackName'] as String,
      collectionName: json['collectionName'] as String,
      artistName: json['artistName'] as String,
      artworkUrl60: json['artworkUrl60'] as String,
      trackNumber: (json['trackNumber'] as num).toInt(),
      previewUrl: json['previewUrl'] as String,
      releaseDate: json['releaseDate'] as String,
      primaryGenreName: json['primaryGenreName'] as String,
      isStreamable: json['isStreamable'] as bool,
    );

Map<String, dynamic> _$$SongDtoImplToJson(_$SongDtoImpl instance) =>
    <String, dynamic>{
      'trackId': instance.trackId,
      'trackName': instance.trackName,
      'collectionName': instance.collectionName,
      'artistName': instance.artistName,
      'artworkUrl60': instance.artworkUrl60,
      'trackNumber': instance.trackNumber,
      'previewUrl': instance.previewUrl,
      'releaseDate': instance.releaseDate,
      'primaryGenreName': instance.primaryGenreName,
      'isStreamable': instance.isStreamable,
    };
