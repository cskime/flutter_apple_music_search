// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AlbumDto _$AlbumDtoFromJson(Map<String, dynamic> json) {
  return _AlbumDto.fromJson(json);
}

/// @nodoc
mixin _$AlbumDto {
  int get collectionId => throw _privateConstructorUsedError;
  String get artistName => throw _privateConstructorUsedError;
  String get collectionName => throw _privateConstructorUsedError;
  String get artworkUrl100 => throw _privateConstructorUsedError;
  int get trackCount => throw _privateConstructorUsedError;
  String get releaseDate => throw _privateConstructorUsedError;
  String get primaryGenreName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumDtoCopyWith<AlbumDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumDtoCopyWith<$Res> {
  factory $AlbumDtoCopyWith(AlbumDto value, $Res Function(AlbumDto) then) =
      _$AlbumDtoCopyWithImpl<$Res, AlbumDto>;
  @useResult
  $Res call(
      {int collectionId,
      String artistName,
      String collectionName,
      String artworkUrl100,
      int trackCount,
      String releaseDate,
      String primaryGenreName});
}

/// @nodoc
class _$AlbumDtoCopyWithImpl<$Res, $Val extends AlbumDto>
    implements $AlbumDtoCopyWith<$Res> {
  _$AlbumDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionId = null,
    Object? artistName = null,
    Object? collectionName = null,
    Object? artworkUrl100 = null,
    Object? trackCount = null,
    Object? releaseDate = null,
    Object? primaryGenreName = null,
  }) {
    return _then(_value.copyWith(
      collectionId: null == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as int,
      artistName: null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
      collectionName: null == collectionName
          ? _value.collectionName
          : collectionName // ignore: cast_nullable_to_non_nullable
              as String,
      artworkUrl100: null == artworkUrl100
          ? _value.artworkUrl100
          : artworkUrl100 // ignore: cast_nullable_to_non_nullable
              as String,
      trackCount: null == trackCount
          ? _value.trackCount
          : trackCount // ignore: cast_nullable_to_non_nullable
              as int,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      primaryGenreName: null == primaryGenreName
          ? _value.primaryGenreName
          : primaryGenreName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlbumDtoImplCopyWith<$Res>
    implements $AlbumDtoCopyWith<$Res> {
  factory _$$AlbumDtoImplCopyWith(
          _$AlbumDtoImpl value, $Res Function(_$AlbumDtoImpl) then) =
      __$$AlbumDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int collectionId,
      String artistName,
      String collectionName,
      String artworkUrl100,
      int trackCount,
      String releaseDate,
      String primaryGenreName});
}

/// @nodoc
class __$$AlbumDtoImplCopyWithImpl<$Res>
    extends _$AlbumDtoCopyWithImpl<$Res, _$AlbumDtoImpl>
    implements _$$AlbumDtoImplCopyWith<$Res> {
  __$$AlbumDtoImplCopyWithImpl(
      _$AlbumDtoImpl _value, $Res Function(_$AlbumDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionId = null,
    Object? artistName = null,
    Object? collectionName = null,
    Object? artworkUrl100 = null,
    Object? trackCount = null,
    Object? releaseDate = null,
    Object? primaryGenreName = null,
  }) {
    return _then(_$AlbumDtoImpl(
      collectionId: null == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as int,
      artistName: null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
      collectionName: null == collectionName
          ? _value.collectionName
          : collectionName // ignore: cast_nullable_to_non_nullable
              as String,
      artworkUrl100: null == artworkUrl100
          ? _value.artworkUrl100
          : artworkUrl100 // ignore: cast_nullable_to_non_nullable
              as String,
      trackCount: null == trackCount
          ? _value.trackCount
          : trackCount // ignore: cast_nullable_to_non_nullable
              as int,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      primaryGenreName: null == primaryGenreName
          ? _value.primaryGenreName
          : primaryGenreName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlbumDtoImpl implements _AlbumDto {
  _$AlbumDtoImpl(
      {required this.collectionId,
      required this.artistName,
      required this.collectionName,
      required this.artworkUrl100,
      required this.trackCount,
      required this.releaseDate,
      required this.primaryGenreName});

  factory _$AlbumDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlbumDtoImplFromJson(json);

  @override
  final int collectionId;
  @override
  final String artistName;
  @override
  final String collectionName;
  @override
  final String artworkUrl100;
  @override
  final int trackCount;
  @override
  final String releaseDate;
  @override
  final String primaryGenreName;

  @override
  String toString() {
    return 'AlbumDto(collectionId: $collectionId, artistName: $artistName, collectionName: $collectionName, artworkUrl100: $artworkUrl100, trackCount: $trackCount, releaseDate: $releaseDate, primaryGenreName: $primaryGenreName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbumDtoImpl &&
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId) &&
            (identical(other.artistName, artistName) ||
                other.artistName == artistName) &&
            (identical(other.collectionName, collectionName) ||
                other.collectionName == collectionName) &&
            (identical(other.artworkUrl100, artworkUrl100) ||
                other.artworkUrl100 == artworkUrl100) &&
            (identical(other.trackCount, trackCount) ||
                other.trackCount == trackCount) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.primaryGenreName, primaryGenreName) ||
                other.primaryGenreName == primaryGenreName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, collectionId, artistName,
      collectionName, artworkUrl100, trackCount, releaseDate, primaryGenreName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlbumDtoImplCopyWith<_$AlbumDtoImpl> get copyWith =>
      __$$AlbumDtoImplCopyWithImpl<_$AlbumDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlbumDtoImplToJson(
      this,
    );
  }
}

abstract class _AlbumDto implements AlbumDto {
  factory _AlbumDto(
      {required final int collectionId,
      required final String artistName,
      required final String collectionName,
      required final String artworkUrl100,
      required final int trackCount,
      required final String releaseDate,
      required final String primaryGenreName}) = _$AlbumDtoImpl;

  factory _AlbumDto.fromJson(Map<String, dynamic> json) =
      _$AlbumDtoImpl.fromJson;

  @override
  int get collectionId;
  @override
  String get artistName;
  @override
  String get collectionName;
  @override
  String get artworkUrl100;
  @override
  int get trackCount;
  @override
  String get releaseDate;
  @override
  String get primaryGenreName;
  @override
  @JsonKey(ignore: true)
  _$$AlbumDtoImplCopyWith<_$AlbumDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
