// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AlbumModel _$AlbumModelFromJson(Map<String, dynamic> json) {
  return _AlbumModel.fromJson(json);
}

/// @nodoc
mixin _$AlbumModel {
  int get collectionId => throw _privateConstructorUsedError;
  String get collectionName => throw _privateConstructorUsedError;
  String get artworkUrl100 => throw _privateConstructorUsedError;
  String get releaseDate => throw _privateConstructorUsedError;
  String get primaryGenreName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumModelCopyWith<AlbumModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumModelCopyWith<$Res> {
  factory $AlbumModelCopyWith(
          AlbumModel value, $Res Function(AlbumModel) then) =
      _$AlbumModelCopyWithImpl<$Res, AlbumModel>;
  @useResult
  $Res call(
      {int collectionId,
      String collectionName,
      String artworkUrl100,
      String releaseDate,
      String primaryGenreName});
}

/// @nodoc
class _$AlbumModelCopyWithImpl<$Res, $Val extends AlbumModel>
    implements $AlbumModelCopyWith<$Res> {
  _$AlbumModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionId = null,
    Object? collectionName = null,
    Object? artworkUrl100 = null,
    Object? releaseDate = null,
    Object? primaryGenreName = null,
  }) {
    return _then(_value.copyWith(
      collectionId: null == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as int,
      collectionName: null == collectionName
          ? _value.collectionName
          : collectionName // ignore: cast_nullable_to_non_nullable
              as String,
      artworkUrl100: null == artworkUrl100
          ? _value.artworkUrl100
          : artworkUrl100 // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$AlbumModelImplCopyWith<$Res>
    implements $AlbumModelCopyWith<$Res> {
  factory _$$AlbumModelImplCopyWith(
          _$AlbumModelImpl value, $Res Function(_$AlbumModelImpl) then) =
      __$$AlbumModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int collectionId,
      String collectionName,
      String artworkUrl100,
      String releaseDate,
      String primaryGenreName});
}

/// @nodoc
class __$$AlbumModelImplCopyWithImpl<$Res>
    extends _$AlbumModelCopyWithImpl<$Res, _$AlbumModelImpl>
    implements _$$AlbumModelImplCopyWith<$Res> {
  __$$AlbumModelImplCopyWithImpl(
      _$AlbumModelImpl _value, $Res Function(_$AlbumModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionId = null,
    Object? collectionName = null,
    Object? artworkUrl100 = null,
    Object? releaseDate = null,
    Object? primaryGenreName = null,
  }) {
    return _then(_$AlbumModelImpl(
      collectionId: null == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as int,
      collectionName: null == collectionName
          ? _value.collectionName
          : collectionName // ignore: cast_nullable_to_non_nullable
              as String,
      artworkUrl100: null == artworkUrl100
          ? _value.artworkUrl100
          : artworkUrl100 // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$AlbumModelImpl implements _AlbumModel {
  _$AlbumModelImpl(
      {required this.collectionId,
      required this.collectionName,
      required this.artworkUrl100,
      required this.releaseDate,
      required this.primaryGenreName});

  factory _$AlbumModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlbumModelImplFromJson(json);

  @override
  final int collectionId;
  @override
  final String collectionName;
  @override
  final String artworkUrl100;
  @override
  final String releaseDate;
  @override
  final String primaryGenreName;

  @override
  String toString() {
    return 'AlbumModel(collectionId: $collectionId, collectionName: $collectionName, artworkUrl100: $artworkUrl100, releaseDate: $releaseDate, primaryGenreName: $primaryGenreName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbumModelImpl &&
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId) &&
            (identical(other.collectionName, collectionName) ||
                other.collectionName == collectionName) &&
            (identical(other.artworkUrl100, artworkUrl100) ||
                other.artworkUrl100 == artworkUrl100) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.primaryGenreName, primaryGenreName) ||
                other.primaryGenreName == primaryGenreName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, collectionId, collectionName,
      artworkUrl100, releaseDate, primaryGenreName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlbumModelImplCopyWith<_$AlbumModelImpl> get copyWith =>
      __$$AlbumModelImplCopyWithImpl<_$AlbumModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlbumModelImplToJson(
      this,
    );
  }
}

abstract class _AlbumModel implements AlbumModel {
  factory _AlbumModel(
      {required final int collectionId,
      required final String collectionName,
      required final String artworkUrl100,
      required final String releaseDate,
      required final String primaryGenreName}) = _$AlbumModelImpl;

  factory _AlbumModel.fromJson(Map<String, dynamic> json) =
      _$AlbumModelImpl.fromJson;

  @override
  int get collectionId;
  @override
  String get collectionName;
  @override
  String get artworkUrl100;
  @override
  String get releaseDate;
  @override
  String get primaryGenreName;
  @override
  @JsonKey(ignore: true)
  _$$AlbumModelImplCopyWith<_$AlbumModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
