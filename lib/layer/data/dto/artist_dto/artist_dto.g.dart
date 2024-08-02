// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtistDtoImpl _$$ArtistDtoImplFromJson(Map<String, dynamic> json) =>
    _$ArtistDtoImpl(
      artistId: (json['artistId'] as num).toInt(),
      artistType: json['artistType'] as String,
      artistName: json['artistName'] as String,
    );

Map<String, dynamic> _$$ArtistDtoImplToJson(_$ArtistDtoImpl instance) =>
    <String, dynamic>{
      'artistId': instance.artistId,
      'artistType': instance.artistType,
      'artistName': instance.artistName,
    };
