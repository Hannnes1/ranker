// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Root _$$_RootFromJson(Map<String, dynamic> json) => _$_Root(
      artists: (json['artists'] as List<dynamic>)
          .map((e) => Artist.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RootToJson(_$_Root instance) => <String, dynamic>{
      'artists': instance.artists.map((e) => e.toJson()).toList(),
    };

_$_Artist _$$_ArtistFromJson(Map<String, dynamic> json) => _$_Artist(
      name: json['name'] as String,
      winHistory: (json['win_history'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      albums: (json['albums'] as List<dynamic>)
          .map((e) => Album.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ArtistToJson(_$_Artist instance) => <String, dynamic>{
      'name': instance.name,
      'win_history': instance.winHistory,
      'albums': instance.albums.map((e) => e.toJson()).toList(),
    };

_$_Album _$$_AlbumFromJson(Map<String, dynamic> json) => _$_Album(
      name: json['name'] as String,
      songs: (json['songs'] as List<dynamic>)
          .map((e) => Song.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AlbumToJson(_$_Album instance) => <String, dynamic>{
      'name': instance.name,
      'songs': instance.songs.map((e) => e.toJson()).toList(),
    };

_$_Song _$$_SongFromJson(Map<String, dynamic> json) => _$_Song(
      name: json['name'] as String,
      position: json['position'] as int?,
    );

Map<String, dynamic> _$$_SongToJson(_$_Song instance) => <String, dynamic>{
      'name': instance.name,
      'position': instance.position,
    };
