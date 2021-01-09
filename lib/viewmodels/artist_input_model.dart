import 'package:flutter/material.dart';
import 'package:ranker/enums/view_state.dart';
import 'package:ranker/locator.dart';
import 'package:ranker/services/file_io.dart';
import 'package:ranker/viewmodels/base_model.dart';
import 'package:ranker/viewmodels/home_model.dart';

class ArtistInputModel extends BaseModel {
  final FileIO _fileIO = locator<FileIO>();
  final HomeModel _homeModel = locator<HomeModel>();

  final _formKey = GlobalKey<FormState>();
  TextEditingController _artistController = TextEditingController();
  List<TextEditingController> _albumControllers = [TextEditingController()];
  List<TextEditingController> _songControllers = [TextEditingController()];

  /// How the list of songs should be converted to a list.
  String _splitPattern = '\n';

  Map<String, Map<String, String>> _songs;

  get formKey => _formKey;

  get splitPattern => _splitPattern;

  get artistController => _artistController;

  get songControllers => _songControllers;

  get albumControllers => _albumControllers;

  changeSplitPattern(value) {
    _splitPattern = value;
    setState();
  }

  save() async {
    // Assert song list is empty before adding songs.
    _songs = {};
    _formKey.currentState.save();
    List<String> albums = [];
    for (TextEditingController album in _albumControllers) {
      albums.add(album.text);
    }
    var file = await _fileIO.saveArtist(_artistController.text, albums, _songs, []);
    _homeModel.loadArtists();
    print(file);
  }

  songsOnSaved(int index, String value) {
    List<String> songList = value.split(_splitPattern);

    // Add non-empty songs to list of songs.
    for (String song in songList) {
      if (song.trim().isNotEmpty) {
        _songs[song.trim()] = {
          'album': _albumControllers[index].text,
          'position': null,
        };
      }
    }
  }

  removeAlbum(int index) {
    _albumControllers.removeAt(index);
    _songControllers.removeAt(index);
    setState();
  }

  addAlbum() {
    _albumControllers.add(TextEditingController());
    _songControllers.add(TextEditingController());
    setState();
  }
}
