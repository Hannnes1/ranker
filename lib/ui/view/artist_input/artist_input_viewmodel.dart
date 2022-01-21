import 'package:flutter/material.dart';
import 'package:ranker/services/file_io.dart';
import 'package:stacked/stacked.dart';
import 'package:ranker/app/app.locator.dart';

class ArtistInputViewModel extends BaseViewModel {
  final FileIO _fileIO = locator<FileIO>();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _artistController = TextEditingController();
  final List<TextEditingController> _albumControllers = [TextEditingController()];
  final List<TextEditingController> _songControllers = [TextEditingController()];

  /// How the list of songs should be converted to a list.
  String _splitPattern = '\n';

  Map<String, Map<String, String?>>? _songs;

  get formKey => _formKey;

  get splitPattern => _splitPattern;

  get artistController => _artistController;

  get songControllers => _songControllers;

  get albumControllers => _albumControllers;

  changeSplitPattern(value) {
    _splitPattern = value;
    notifyListeners();
  }

  save() async {
    // Assert song list is empty before adding songs.
    _songs = {};
    _formKey.currentState!.save();
    final albums = <String>[];
    for (final album in _albumControllers) {
      albums.add(album.text);
    }
    final file = await _fileIO.saveArtist(_artistController.text, albums, _songs!, []);
    print(file);
  }

  songsOnSaved(int index, String value) {
    final songList = value.split(_splitPattern);

    // Add non-empty songs to list of songs.
    for (final song in songList) {
      if (song.trim().isNotEmpty) {
        _songs?[song.trim()] = {
          'album': _albumControllers[index].text,
          'position': null,
        };
      }
    }
  }

  removeAlbum(int index) {
    _albumControllers.removeAt(index);
    _songControllers.removeAt(index);
    notifyListeners();
  }

  addAlbum() {
    _albumControllers.add(TextEditingController());
    _songControllers.add(TextEditingController());
    notifyListeners();
  }
}