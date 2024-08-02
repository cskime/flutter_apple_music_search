// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Album {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get artistName => throw _privateConstructorUsedError;
  String get coverImageUrl => throw _privateConstructorUsedError;
  int get numberOfSongs => throw _privateConstructorUsedError;
  String get releaseDate => throw _privateConstructorUsedError;
  String get primaryGenreName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlbumCopyWith<Album> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumCopyWith<$Res> {
  factory $AlbumCopyWith(Album value, $Res Function(Album) then) =
      _$AlbumCopyWithImpl<$Res, Album>;
  @useResult
  $Res call(
      {int id,
      String title,
      String artistName,
      String coverImageUrl,
      int numberOfSongs,
      String releaseDate,
      String primaryGenreName});
}

/// @nodoc
class _$AlbumCopyWithImpl<$Res, $Val extends Album>
    implements $AlbumCopyWith<$Res> {
  _$AlbumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? artistName = null,
    Object? coverImageUrl = null,
    Object? numberOfSongs = null,
    Object? releaseDate = null,
    Object? primaryGenreName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artistName: null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
      coverImageUrl: null == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfSongs: null == numberOfSongs
          ? _value.numberOfSongs
          : numberOfSongs // ignore: cast_nullable_to_non_nullable
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
abstract class _$$AlbumImplCopyWith<$Res> implements $AlbumCopyWith<$Res> {
  factory _$$AlbumImplCopyWith(
          _$AlbumImpl value, $Res Function(_$AlbumImpl) then) =
      __$$AlbumImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String artistName,
      String coverImageUrl,
      int numberOfSongs,
      String releaseDate,
      String primaryGenreName});
}

/// @nodoc
class __$$AlbumImplCopyWithImpl<$Res>
    extends _$AlbumCopyWithImpl<$Res, _$AlbumImpl>
    implements _$$AlbumImplCopyWith<$Res> {
  __$$AlbumImplCopyWithImpl(
      _$AlbumImpl _value, $Res Function(_$AlbumImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? artistName = null,
    Object? coverImageUrl = null,
    Object? numberOfSongs = null,
    Object? releaseDate = null,
    Object? primaryGenreName = null,
  }) {
    return _then(_$AlbumImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artistName: null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
      coverImageUrl: null == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfSongs: null == numberOfSongs
          ? _value.numberOfSongs
          : numberOfSongs // ignore: cast_nullable_to_non_nullable
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

class _$AlbumImpl implements _Album {
  _$AlbumImpl(
      {required this.id,
      required this.title,
      required this.artistName,
      required this.coverImageUrl,
      required this.numberOfSongs,
      required this.releaseDate,
      required this.primaryGenreName});

  @override
  final int id;
  @override
  final String title;
  @override
  final String artistName;
  @override
  final String coverImageUrl;
  @override
  final int numberOfSongs;
  @override
  final String releaseDate;
  @override
  final String primaryGenreName;

  @override
  String toString() {
    return 'Album(id: $id, title: $title, artistName: $artistName, coverImageUrl: $coverImageUrl, numberOfSongs: $numberOfSongs, releaseDate: $releaseDate, primaryGenreName: $primaryGenreName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbumImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.artistName, artistName) ||
                other.artistName == artistName) &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                other.coverImageUrl == coverImageUrl) &&
            (identical(other.numberOfSongs, numberOfSongs) ||
                other.numberOfSongs == numberOfSongs) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.primaryGenreName, primaryGenreName) ||
                other.primaryGenreName == primaryGenreName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, artistName,
      coverImageUrl, numberOfSongs, releaseDate, primaryGenreName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlbumImplCopyWith<_$AlbumImpl> get copyWith =>
      __$$AlbumImplCopyWithImpl<_$AlbumImpl>(this, _$identity);
}

abstract class _Album implements Album {
  factory _Album(
      {required final int id,
      required final String title,
      required final String artistName,
      required final String coverImageUrl,
      required final int numberOfSongs,
      required final String releaseDate,
      required final String primaryGenreName}) = _$AlbumImpl;

  @override
  int get id;
  @override
  String get title;
  @override
  String get artistName;
  @override
  String get coverImageUrl;
  @override
  int get numberOfSongs;
  @override
  String get releaseDate;
  @override
  String get primaryGenreName;
  @override
  @JsonKey(ignore: true)
  _$$AlbumImplCopyWith<_$AlbumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
