// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlbumModelImpl _$$AlbumModelImplFromJson(Map<String, dynamic> json) =>
    _$AlbumModelImpl(
      collectionId: (json['collectionId'] as num).toInt(),
      artistName: json['artistName'] as String,
      collectionName: json['collectionName'] as String,
      artworkUrl100: json['artworkUrl100'] as String,
      trackCount: (json['trackCount'] as num).toInt(),
      releaseDate: json['releaseDate'] as String,
      primaryGenreName: json['primaryGenreName'] as String,
    );

Map<String, dynamic> _$$AlbumModelImplToJson(_$AlbumModelImpl instance) =>
    <String, dynamic>{
      'collectionId': instance.collectionId,
      'artistName': instance.artistName,
      'collectionName': instance.collectionName,
      'artworkUrl100': instance.artworkUrl100,
      'trackCount': instance.trackCount,
      'releaseDate': instance.releaseDate,
      'primaryGenreName': instance.primaryGenreName,
    };
