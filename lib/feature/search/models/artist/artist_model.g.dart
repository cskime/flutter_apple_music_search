// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtistModelImpl _$$ArtistModelImplFromJson(Map<String, dynamic> json) =>
    _$ArtistModelImpl(
      artistId: (json['artistId'] as num).toInt(),
      artistType: json['artistType'] as String,
      artistName: json['artistName'] as String,
    );

Map<String, dynamic> _$$ArtistModelImplToJson(_$ArtistModelImpl instance) =>
    <String, dynamic>{
      'artistId': instance.artistId,
      'artistType': instance.artistType,
      'artistName': instance.artistName,
    };
