import 'package:freezed_annotation/freezed_annotation.dart';

part 'json.freezed.dart';
part 'json.g.dart';

@freezed
class Root with _$Root {
  factory Root({
    required List<Artist> artists,
  }) = _Root;

  factory Root.fromJson(Map<String, dynamic> json) => _$RootFromJson(json);
}

@freezed
class Artist with _$Artist {
  factory Artist({
    required String name,
    /// History of winners when comparing all of the artist's songs.
    /// 
    /// Each element is the name of a song.
    @JsonKey(name: 'win_history') @Default([]) List<String> winHistory,
    required List<Album> albums,
  }) = _Artist;

factory Artist.fromJson(Map<String, dynamic> json) => 
_$ArtistFromJson(json);
}

@freezed
class Album with _$Album {
  factory Album({
    required String name,
    required List<Song> songs,
  }) = _Album;

factory Album.fromJson(Map<String, dynamic> json) => 
_$AlbumFromJson(json);
}

@freezed
class Song with _$Song {
  factory Song({
    required String name,
    /// The rank of the song among all of the artist's songs.
    /// 
    /// Will be null if ranking is not completed.
    int? position,
  }) = _Song;

factory Song.fromJson(Map<String, dynamic> json) => 
_$SongFromJson(json);
}