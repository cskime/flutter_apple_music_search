// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlbumModelImpl _$$AlbumModelImplFromJson(Map<String, dynamic> json) =>
    _$AlbumModelImpl(
      collectionId: (json['collectionId'] as num).toInt(),
      collectionName: json['collectionName'] as String,
      artworkUrl100: json['artworkUrl100'] as String,
      releaseDate: json['releaseDate'] as String,
      primaryGenreName: json['primaryGenreName'] as String,
    );

Map<String, dynamic> _$$AlbumModelImplToJson(_$AlbumModelImpl instance) =>
    <String, dynamic>{
      'collectionId': instance.collectionId,
      'collectionName': instance.collectionName,
      'artworkUrl100': instance.artworkUrl100,
      'releaseDate': instance.releaseDate,
      'primaryGenreName': instance.primaryGenreName,
    };
