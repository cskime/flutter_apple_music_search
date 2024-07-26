// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TrackModel _$TrackModelFromJson(Map<String, dynamic> json) {
  return _TrackModel.fromJson(json);
}

/// @nodoc
mixin _$TrackModel {
  int get trackId => throw _privateConstructorUsedError;
  String get trackName => throw _privateConstructorUsedError;
  String get artworkUrl60 => throw _privateConstructorUsedError;
  int get trackNumber => throw _privateConstructorUsedError;
  String get releaseDate => throw _privateConstructorUsedError;
  bool get isStreamable => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrackModelCopyWith<TrackModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackModelCopyWith<$Res> {
  factory $TrackModelCopyWith(
          TrackModel value, $Res Function(TrackModel) then) =
      _$TrackModelCopyWithImpl<$Res, TrackModel>;
  @useResult
  $Res call(
      {int trackId,
      String trackName,
      String artworkUrl60,
      int trackNumber,
      String releaseDate,
      bool isStreamable});
}

/// @nodoc
class _$TrackModelCopyWithImpl<$Res, $Val extends TrackModel>
    implements $TrackModelCopyWith<$Res> {
  _$TrackModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trackId = null,
    Object? trackName = null,
    Object? artworkUrl60 = null,
    Object? trackNumber = null,
    Object? releaseDate = null,
    Object? isStreamable = null,
  }) {
    return _then(_value.copyWith(
      trackId: null == trackId
          ? _value.trackId
          : trackId // ignore: cast_nullable_to_non_nullable
              as int,
      trackName: null == trackName
          ? _value.trackName
          : trackName // ignore: cast_nullable_to_non_nullable
              as String,
      artworkUrl60: null == artworkUrl60
          ? _value.artworkUrl60
          : artworkUrl60 // ignore: cast_nullable_to_non_nullable
              as String,
      trackNumber: null == trackNumber
          ? _value.trackNumber
          : trackNumber // ignore: cast_nullable_to_non_nullable
              as int,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      isStreamable: null == isStreamable
          ? _value.isStreamable
          : isStreamable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrackModelImplCopyWith<$Res>
    implements $TrackModelCopyWith<$Res> {
  factory _$$TrackModelImplCopyWith(
          _$TrackModelImpl value, $Res Function(_$TrackModelImpl) then) =
      __$$TrackModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int trackId,
      String trackName,
      String artworkUrl60,
      int trackNumber,
      String releaseDate,
      bool isStreamable});
}

/// @nodoc
class __$$TrackModelImplCopyWithImpl<$Res>
    extends _$TrackModelCopyWithImpl<$Res, _$TrackModelImpl>
    implements _$$TrackModelImplCopyWith<$Res> {
  __$$TrackModelImplCopyWithImpl(
      _$TrackModelImpl _value, $Res Function(_$TrackModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trackId = null,
    Object? trackName = null,
    Object? artworkUrl60 = null,
    Object? trackNumber = null,
    Object? releaseDate = null,
    Object? isStreamable = null,
  }) {
    return _then(_$TrackModelImpl(
      trackId: null == trackId
          ? _value.trackId
          : trackId // ignore: cast_nullable_to_non_nullable
              as int,
      trackName: null == trackName
          ? _value.trackName
          : trackName // ignore: cast_nullable_to_non_nullable
              as String,
      artworkUrl60: null == artworkUrl60
          ? _value.artworkUrl60
          : artworkUrl60 // ignore: cast_nullable_to_non_nullable
              as String,
      trackNumber: null == trackNumber
          ? _value.trackNumber
          : trackNumber // ignore: cast_nullable_to_non_nullable
              as int,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      isStreamable: null == isStreamable
          ? _value.isStreamable
          : isStreamable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackModelImpl implements _TrackModel {
  _$TrackModelImpl(
      {required this.trackId,
      required this.trackName,
      required this.artworkUrl60,
      required this.trackNumber,
      required this.releaseDate,
      required this.isStreamable});

  factory _$TrackModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackModelImplFromJson(json);

  @override
  final int trackId;
  @override
  final String trackName;
  @override
  final String artworkUrl60;
  @override
  final int trackNumber;
  @override
  final String releaseDate;
  @override
  final bool isStreamable;

  @override
  String toString() {
    return 'TrackModel(trackId: $trackId, trackName: $trackName, artworkUrl60: $artworkUrl60, trackNumber: $trackNumber, releaseDate: $releaseDate, isStreamable: $isStreamable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackModelImpl &&
            (identical(other.trackId, trackId) || other.trackId == trackId) &&
            (identical(other.trackName, trackName) ||
                other.trackName == trackName) &&
            (identical(other.artworkUrl60, artworkUrl60) ||
                other.artworkUrl60 == artworkUrl60) &&
            (identical(other.trackNumber, trackNumber) ||
                other.trackNumber == trackNumber) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.isStreamable, isStreamable) ||
                other.isStreamable == isStreamable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, trackId, trackName, artworkUrl60,
      trackNumber, releaseDate, isStreamable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackModelImplCopyWith<_$TrackModelImpl> get copyWith =>
      __$$TrackModelImplCopyWithImpl<_$TrackModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackModelImplToJson(
      this,
    );
  }
}

abstract class _TrackModel implements TrackModel {
  factory _TrackModel(
      {required final int trackId,
      required final String trackName,
      required final String artworkUrl60,
      required final int trackNumber,
      required final String releaseDate,
      required final bool isStreamable}) = _$TrackModelImpl;

  factory _TrackModel.fromJson(Map<String, dynamic> json) =
      _$TrackModelImpl.fromJson;

  @override
  int get trackId;
  @override
  String get trackName;
  @override
  String get artworkUrl60;
  @override
  int get trackNumber;
  @override
  String get releaseDate;
  @override
  bool get isStreamable;
  @override
  @JsonKey(ignore: true)
  _$$TrackModelImplCopyWith<_$TrackModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}