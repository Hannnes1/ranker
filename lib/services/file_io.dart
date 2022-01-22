import 'dart:io';
import 'dart:convert';

import 'package:path_provider/path_provider.dart';
import 'package:ranker/models/json.dart';

/// Read / write to files.
class FileIO {
  /// Cached content of the artists file.
  ///
  /// This should not be accessed directly. Use [_root] instead.
  Root? _cache;

  /// The entire JSON file.
  Future<Root> get _root async {
    if (_cache == null) {
      final file = File('${await _localPath}/artists.json');

      try {
        _cache = Root.fromJson(jsonDecode(await file.readAsString()));
      } on FileSystemException {
        _cache = Root(artists: []);
      }
    }

    return _cache!;
  }

  /// Save artists to a json file and cache it.
  Future<Root> saveArtistsFile(Root root) async {
    final file = File('${await _localPath}/artists.json');

    // Create the file if it doesn't exist.
    await file.create();

    file.writeAsString(json.encode(root.toJson()));

    _cache = root;
    return root;
  }

  /// Get the path to the directory where the local JSON file is stored.
  Future<String> get _localPath async {
    Directory? directory;
    if (Platform.isIOS) {
      // TODO: Make this available to the user.
      directory = await getApplicationDocumentsDirectory();
    } else if (Platform.isAndroid) {
      directory = await getExternalStorageDirectory();
    }

    if (directory == null) {
      // TODO: Handle this error with a dialog.
      throw Exception('Could not get directory.');
    } else {
      return directory.path;
    }
  }

  /// Saves an artist and its songs and albums to a local JSON file.
  Future<void> saveArtist(Artist artist) async {
    final root = await _root;
    final artists = root.artists;

    // Remove old artist to avoid duplicates.
    artists.removeWhere((e) => e.name == artist.name);

    artists.add(artist);

    await saveArtistsFile(root.copyWith(artists: artists));
  }

  Future<Artist> readArtist(String artist) async {
    return (await _root).artists.firstWhere((e) => e.name == artist);
  }

  Future<List<String>> readArtistNames() async {
    return (await _root).artists.map((e) => e.name).toList();
  }

  Future<List<Artist>> removeArtist(String artist) async {
    final root = await _root;
    final artists = root.artists;

    artists.removeWhere((e) => e.name == artist);

    return (await saveArtistsFile(root.copyWith(artists: artists))).artists;
  }
}
