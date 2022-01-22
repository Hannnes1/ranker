// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Root _$RootFromJson(Map<String, dynamic> json) {
  return _Root.fromJson(json);
}

/// @nodoc
class _$RootTearOff {
  const _$RootTearOff();

  _Root call({required List<Artist> artists}) {
    return _Root(
      artists: artists,
    );
  }

  Root fromJson(Map<String, Object?> json) {
    return Root.fromJson(json);
  }
}

/// @nodoc
const $Root = _$RootTearOff();

/// @nodoc
mixin _$Root {
  List<Artist> get artists => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RootCopyWith<Root> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RootCopyWith<$Res> {
  factory $RootCopyWith(Root value, $Res Function(Root) then) =
      _$RootCopyWithImpl<$Res>;
  $Res call({List<Artist> artists});
}

/// @nodoc
class _$RootCopyWithImpl<$Res> implements $RootCopyWith<$Res> {
  _$RootCopyWithImpl(this._value, this._then);

  final Root _value;
  // ignore: unused_field
  final $Res Function(Root) _then;

  @override
  $Res call({
    Object? artists = freezed,
  }) {
    return _then(_value.copyWith(
      artists: artists == freezed
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<Artist>,
    ));
  }
}

/// @nodoc
abstract class _$RootCopyWith<$Res> implements $RootCopyWith<$Res> {
  factory _$RootCopyWith(_Root value, $Res Function(_Root) then) =
      __$RootCopyWithImpl<$Res>;
  @override
  $Res call({List<Artist> artists});
}

/// @nodoc
class __$RootCopyWithImpl<$Res> extends _$RootCopyWithImpl<$Res>
    implements _$RootCopyWith<$Res> {
  __$RootCopyWithImpl(_Root _value, $Res Function(_Root) _then)
      : super(_value, (v) => _then(v as _Root));

  @override
  _Root get _value => super._value as _Root;

  @override
  $Res call({
    Object? artists = freezed,
  }) {
    return _then(_Root(
      artists: artists == freezed
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<Artist>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Root implements _Root {
  _$_Root({required this.artists});

  factory _$_Root.fromJson(Map<String, dynamic> json) => _$$_RootFromJson(json);

  @override
  final List<Artist> artists;

  @override
  String toString() {
    return 'Root(artists: $artists)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Root &&
            const DeepCollectionEquality().equals(other.artists, artists));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(artists));

  @JsonKey(ignore: true)
  @override
  _$RootCopyWith<_Root> get copyWith =>
      __$RootCopyWithImpl<_Root>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RootToJson(this);
  }
}

abstract class _Root implements Root {
  factory _Root({required List<Artist> artists}) = _$_Root;

  factory _Root.fromJson(Map<String, dynamic> json) = _$_Root.fromJson;

  @override
  List<Artist> get artists;
  @override
  @JsonKey(ignore: true)
  _$RootCopyWith<_Root> get copyWith => throw _privateConstructorUsedError;
}

Artist _$ArtistFromJson(Map<String, dynamic> json) {
  return _Artist.fromJson(json);
}

/// @nodoc
class _$ArtistTearOff {
  const _$ArtistTearOff();

  _Artist call(
      {required String name,
      @JsonKey(name: 'win_history') List<String> winHistory = const [],
      required List<Album> albums}) {
    return _Artist(
      name: name,
      winHistory: winHistory,
      albums: albums,
    );
  }

  Artist fromJson(Map<String, Object?> json) {
    return Artist.fromJson(json);
  }
}

/// @nodoc
const $Artist = _$ArtistTearOff();

/// @nodoc
mixin _$Artist {
  String get name => throw _privateConstructorUsedError;

  /// History of winners when comparing all of the artist's songs.
  ///
  /// Each element is the name of a song.
  @JsonKey(name: 'win_history')
  List<String> get winHistory => throw _privateConstructorUsedError;
  List<Album> get albums => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtistCopyWith<Artist> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistCopyWith<$Res> {
  factory $ArtistCopyWith(Artist value, $Res Function(Artist) then) =
      _$ArtistCopyWithImpl<$Res>;
  $Res call(
      {String name,
      @JsonKey(name: 'win_history') List<String> winHistory,
      List<Album> albums});
}

/// @nodoc
class _$ArtistCopyWithImpl<$Res> implements $ArtistCopyWith<$Res> {
  _$ArtistCopyWithImpl(this._value, this._then);

  final Artist _value;
  // ignore: unused_field
  final $Res Function(Artist) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? winHistory = freezed,
    Object? albums = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      winHistory: winHistory == freezed
          ? _value.winHistory
          : winHistory // ignore: cast_nullable_to_non_nullable
              as List<String>,
      albums: albums == freezed
          ? _value.albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<Album>,
    ));
  }
}

/// @nodoc
abstract class _$ArtistCopyWith<$Res> implements $ArtistCopyWith<$Res> {
  factory _$ArtistCopyWith(_Artist value, $Res Function(_Artist) then) =
      __$ArtistCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      @JsonKey(name: 'win_history') List<String> winHistory,
      List<Album> albums});
}

/// @nodoc
class __$ArtistCopyWithImpl<$Res> extends _$ArtistCopyWithImpl<$Res>
    implements _$ArtistCopyWith<$Res> {
  __$ArtistCopyWithImpl(_Artist _value, $Res Function(_Artist) _then)
      : super(_value, (v) => _then(v as _Artist));

  @override
  _Artist get _value => super._value as _Artist;

  @override
  $Res call({
    Object? name = freezed,
    Object? winHistory = freezed,
    Object? albums = freezed,
  }) {
    return _then(_Artist(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      winHistory: winHistory == freezed
          ? _value.winHistory
          : winHistory // ignore: cast_nullable_to_non_nullable
              as List<String>,
      albums: albums == freezed
          ? _value.albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<Album>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Artist implements _Artist {
  _$_Artist(
      {required this.name,
      @JsonKey(name: 'win_history') this.winHistory = const [],
      required this.albums});

  factory _$_Artist.fromJson(Map<String, dynamic> json) =>
      _$$_ArtistFromJson(json);

  @override
  final String name;
  @override

  /// History of winners when comparing all of the artist's songs.
  ///
  /// Each element is the name of a song.
  @JsonKey(name: 'win_history')
  final List<String> winHistory;
  @override
  final List<Album> albums;

  @override
  String toString() {
    return 'Artist(name: $name, winHistory: $winHistory, albums: $albums)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Artist &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.winHistory, winHistory) &&
            const DeepCollectionEquality().equals(other.albums, albums));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(winHistory),
      const DeepCollectionEquality().hash(albums));

  @JsonKey(ignore: true)
  @override
  _$ArtistCopyWith<_Artist> get copyWith =>
      __$ArtistCopyWithImpl<_Artist>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArtistToJson(this);
  }
}

abstract class _Artist implements Artist {
  factory _Artist(
      {required String name,
      @JsonKey(name: 'win_history') List<String> winHistory,
      required List<Album> albums}) = _$_Artist;

  factory _Artist.fromJson(Map<String, dynamic> json) = _$_Artist.fromJson;

  @override
  String get name;
  @override

  /// History of winners when comparing all of the artist's songs.
  ///
  /// Each element is the name of a song.
  @JsonKey(name: 'win_history')
  List<String> get winHistory;
  @override
  List<Album> get albums;
  @override
  @JsonKey(ignore: true)
  _$ArtistCopyWith<_Artist> get copyWith => throw _privateConstructorUsedError;
}

Album _$AlbumFromJson(Map<String, dynamic> json) {
  return _Album.fromJson(json);
}

/// @nodoc
class _$AlbumTearOff {
  const _$AlbumTearOff();

  _Album call({required String name, required List<Song> songs}) {
    return _Album(
      name: name,
      songs: songs,
    );
  }

  Album fromJson(Map<String, Object?> json) {
    return Album.fromJson(json);
  }
}

/// @nodoc
const $Album = _$AlbumTearOff();

/// @nodoc
mixin _$Album {
  String get name => throw _privateConstructorUsedError;
  List<Song> get songs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumCopyWith<Album> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumCopyWith<$Res> {
  factory $AlbumCopyWith(Album value, $Res Function(Album) then) =
      _$AlbumCopyWithImpl<$Res>;
  $Res call({String name, List<Song> songs});
}

/// @nodoc
class _$AlbumCopyWithImpl<$Res> implements $AlbumCopyWith<$Res> {
  _$AlbumCopyWithImpl(this._value, this._then);

  final Album _value;
  // ignore: unused_field
  final $Res Function(Album) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? songs = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      songs: songs == freezed
          ? _value.songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<Song>,
    ));
  }
}

/// @nodoc
abstract class _$AlbumCopyWith<$Res> implements $AlbumCopyWith<$Res> {
  factory _$AlbumCopyWith(_Album value, $Res Function(_Album) then) =
      __$AlbumCopyWithImpl<$Res>;
  @override
  $Res call({String name, List<Song> songs});
}

/// @nodoc
class __$AlbumCopyWithImpl<$Res> extends _$AlbumCopyWithImpl<$Res>
    implements _$AlbumCopyWith<$Res> {
  __$AlbumCopyWithImpl(_Album _value, $Res Function(_Album) _then)
      : super(_value, (v) => _then(v as _Album));

  @override
  _Album get _value => super._value as _Album;

  @override
  $Res call({
    Object? name = freezed,
    Object? songs = freezed,
  }) {
    return _then(_Album(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      songs: songs == freezed
          ? _value.songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<Song>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Album implements _Album {
  _$_Album({required this.name, required this.songs});

  factory _$_Album.fromJson(Map<String, dynamic> json) =>
      _$$_AlbumFromJson(json);

  @override
  final String name;
  @override
  final List<Song> songs;

  @override
  String toString() {
    return 'Album(name: $name, songs: $songs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Album &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.songs, songs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(songs));

  @JsonKey(ignore: true)
  @override
  _$AlbumCopyWith<_Album> get copyWith =>
      __$AlbumCopyWithImpl<_Album>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AlbumToJson(this);
  }
}

abstract class _Album implements Album {
  factory _Album({required String name, required List<Song> songs}) = _$_Album;

  factory _Album.fromJson(Map<String, dynamic> json) = _$_Album.fromJson;

  @override
  String get name;
  @override
  List<Song> get songs;
  @override
  @JsonKey(ignore: true)
  _$AlbumCopyWith<_Album> get copyWith => throw _privateConstructorUsedError;
}

Song _$SongFromJson(Map<String, dynamic> json) {
  return _Song.fromJson(json);
}

/// @nodoc
class _$SongTearOff {
  const _$SongTearOff();

  _Song call({required String name, int? position}) {
    return _Song(
      name: name,
      position: position,
    );
  }

  Song fromJson(Map<String, Object?> json) {
    return Song.fromJson(json);
  }
}

/// @nodoc
const $Song = _$SongTearOff();

/// @nodoc
mixin _$Song {
  String get name => throw _privateConstructorUsedError;

  /// The rank of the song among all of the artist's songs.
  ///
  /// Will be null if ranking is not completed.
  int? get position => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongCopyWith<Song> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongCopyWith<$Res> {
  factory $SongCopyWith(Song value, $Res Function(Song) then) =
      _$SongCopyWithImpl<$Res>;
  $Res call({String name, int? position});
}

/// @nodoc
class _$SongCopyWithImpl<$Res> implements $SongCopyWith<$Res> {
  _$SongCopyWithImpl(this._value, this._then);

  final Song _value;
  // ignore: unused_field
  final $Res Function(Song) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? position = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$SongCopyWith<$Res> implements $SongCopyWith<$Res> {
  factory _$SongCopyWith(_Song value, $Res Function(_Song) then) =
      __$SongCopyWithImpl<$Res>;
  @override
  $Res call({String name, int? position});
}

/// @nodoc
class __$SongCopyWithImpl<$Res> extends _$SongCopyWithImpl<$Res>
    implements _$SongCopyWith<$Res> {
  __$SongCopyWithImpl(_Song _value, $Res Function(_Song) _then)
      : super(_value, (v) => _then(v as _Song));

  @override
  _Song get _value => super._value as _Song;

  @override
  $Res call({
    Object? name = freezed,
    Object? position = freezed,
  }) {
    return _then(_Song(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Song implements _Song {
  _$_Song({required this.name, this.position});

  factory _$_Song.fromJson(Map<String, dynamic> json) => _$$_SongFromJson(json);

  @override
  final String name;
  @override

  /// The rank of the song among all of the artist's songs.
  ///
  /// Will be null if ranking is not completed.
  final int? position;

  @override
  String toString() {
    return 'Song(name: $name, position: $position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Song &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.position, position));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(position));

  @JsonKey(ignore: true)
  @override
  _$SongCopyWith<_Song> get copyWith =>
      __$SongCopyWithImpl<_Song>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SongToJson(this);
  }
}

abstract class _Song implements Song {
  factory _Song({required String name, int? position}) = _$_Song;

  factory _Song.fromJson(Map<String, dynamic> json) = _$_Song.fromJson;

  @override
  String get name;
  @override

  /// The rank of the song among all of the artist's songs.
  ///
  /// Will be null if ranking is not completed.
  int? get position;
  @override
  @JsonKey(ignore: true)
  _$SongCopyWith<_Song> get copyWith => throw _privateConstructorUsedError;
}
