// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlbumDtoImpl _$$AlbumDtoImplFromJson(Map<String, dynamic> json) =>
    _$AlbumDtoImpl(
      collectionId: (json['collectionId'] as num).toInt(),
      artistName: json['artistName'] as String,
      collectionName: json['collectionName'] as String,
      artworkUrl100: json['artworkUrl100'] as String,
      trackCount: (json['trackCount'] as num).toInt(),
      releaseDate: json['releaseDate'] as String,
      primaryGenreName: json['primaryGenreName'] as String,
    );

Map<String, dynamic> _$$AlbumDtoImplToJson(_$AlbumDtoImpl instance) =>
    <String, dynamic>{
      'collectionId': instance.collectionId,
      'artistName': instance.artistName,
      'collectionName': instance.collectionName,
      'artworkUrl100': instance.artworkUrl100,
      'trackCount': instance.trackCount,
      'releaseDate': instance.releaseDate,
      'primaryGenreName': instance.primaryGenreName,
    };
