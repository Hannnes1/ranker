import 'dart:io';
import 'dart:convert';

import 'package:path_provider/path_provider.dart';

/// Read / write to files.
class FileIO {
  // Get the path to the document directory.
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  /// Saves an artist and its content as json to a file with
  /// the same name as the artist.
  Future<File?> saveArtist(
      String artist, List<String> albums, Map<String, Map<String, String?>> songs, List<String> winHistory) async {
    final path = await _localPath;
    final file = File('$path/artists/$artist.json');
    const encoder = JsonEncoder.withIndent('  ');

    final json = {
      'artist': artist,
      'albums': albums,
      'songs': songs,
      'winHistory': winHistory,
    };

    final jsonString = encoder.convert(json);
    Directory('$path/artists').createSync();
    try {
      return file.writeAsString(jsonString);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Map<String, dynamic>> readArtist(String artist) async {
    try {
      final path = await _localPath;
      final file = File('$path/artists/$artist.json');

      final jsonString = await file.readAsString();
      return jsonDecode(jsonString);
    } catch (e) {
      // TODO: Return empty artist map
      print(e);
      return {};
    }
  }

  Future<List<String>> readArtistNames() async {
    final path = await _localPath;

    late final List<FileSystemEntity> files;

    try {
      files = Directory('$path/artists').listSync();
    } catch (e) {
      print(e);
      files = [];
    }

    final artistNames = <String>[];
    for (final file in files) {
      artistNames.add(
          file.path.toString().replaceFirst(file.parent.path.toString() + '/', '').replaceAll(RegExp(r'\.json$'), ''));
    }
    return artistNames;
  }

  Future<List<String>?> removeArtist(String artist) async {
    final path = await _localPath;
    try {
      await File('$path/artists/$artist.json').delete();
      return await readArtistNames();
    } catch (e) {
      return null;
    }
  }
}
