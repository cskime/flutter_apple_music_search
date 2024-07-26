// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'itunes_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItunesResult _$ItunesResultFromJson(Map<String, dynamic> json) {
  return _ItunesResult.fromJson(json);
}

/// @nodoc
mixin _$ItunesResult {
  List<Map<String, dynamic>> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItunesResultCopyWith<ItunesResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItunesResultCopyWith<$Res> {
  factory $ItunesResultCopyWith(
          ItunesResult value, $Res Function(ItunesResult) then) =
      _$ItunesResultCopyWithImpl<$Res, ItunesResult>;
  @useResult
  $Res call({List<Map<String, dynamic>> results});
}

/// @nodoc
class _$ItunesResultCopyWithImpl<$Res, $Val extends ItunesResult>
    implements $ItunesResultCopyWith<$Res> {
  _$ItunesResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItunesResultImplCopyWith<$Res>
    implements $ItunesResultCopyWith<$Res> {
  factory _$$ItunesResultImplCopyWith(
          _$ItunesResultImpl value, $Res Function(_$ItunesResultImpl) then) =
      __$$ItunesResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Map<String, dynamic>> results});
}

/// @nodoc
class __$$ItunesResultImplCopyWithImpl<$Res>
    extends _$ItunesResultCopyWithImpl<$Res, _$ItunesResultImpl>
    implements _$$ItunesResultImplCopyWith<$Res> {
  __$$ItunesResultImplCopyWithImpl(
      _$ItunesResultImpl _value, $Res Function(_$ItunesResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_$ItunesResultImpl(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItunesResultImpl implements _ItunesResult {
  _$ItunesResultImpl({required final List<Map<String, dynamic>> results})
      : _results = results;

  factory _$ItunesResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItunesResultImplFromJson(json);

  final List<Map<String, dynamic>> _results;
  @override
  List<Map<String, dynamic>> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'ItunesResult(results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItunesResultImpl &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItunesResultImplCopyWith<_$ItunesResultImpl> get copyWith =>
      __$$ItunesResultImplCopyWithImpl<_$ItunesResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItunesResultImplToJson(
      this,
    );
  }
}

abstract class _ItunesResult implements ItunesResult {
  factory _ItunesResult({required final List<Map<String, dynamic>> results}) =
      _$ItunesResultImpl;

  factory _ItunesResult.fromJson(Map<String, dynamic> json) =
      _$ItunesResultImpl.fromJson;

  @override
  List<Map<String, dynamic>> get results;
  @override
  @JsonKey(ignore: true)
  _$$ItunesResultImplCopyWith<_$ItunesResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
