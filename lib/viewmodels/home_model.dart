import 'dart:async';

import 'package:ranker/locator.dart';
import 'package:ranker/services/file_io.dart';
import 'package:ranker/viewmodels/base_model.dart';

class HomeModel extends BaseModel {
  final FileIO _fileIO = locator<FileIO>();
  StreamController<List<Map>> artistController = StreamController<List<Map>>();

  Future loadArtists({String remove}) async {
    List<Map> artists = [];
    List<String> artistNames;
    if (remove != null) {
      artistNames = await _fileIO.removeArtist(remove);
    } else {
      artistNames = await _fileIO.readArtistNames();
    }
    for (String artist in artistNames) {
      artists.add(await _fileIO.readArtist(artist));
    }
    artistController.add(artists);
  }
}
