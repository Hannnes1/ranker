import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ranker/app/extenstions.dart';
import 'package:ranker/models/json.dart';
import 'package:ranker/services/file_io.dart';
import 'package:stacked/stacked.dart';
import 'package:ranker/app/app.locator.dart';

class ArtistInputViewModel extends BaseViewModel {
  final FileIO _fileIO = locator<FileIO>();

  final formKey = GlobalKey<FormState>();
  final TextEditingController artistController = TextEditingController();
  final List<TextEditingController> albumControllers = [TextEditingController()];
  final List<TextEditingController> songControllers = [TextEditingController()];

  /// How the list of songs should be converted to a list.
  String _splitPattern = '\n';

  set splitPattern(String value) {
    _splitPattern = value;
    notifyListeners();
  }

  String get splitPattern => _splitPattern;

  save() async {
    if (formKey.currentState!.validate()) {
      final songNames = songControllers.expand((e) => e.text.split(_splitPattern)).toList();
      
      // This list is used to sort the songs in a random order.
      final orderNumbers = List.generate(songNames.length, (index) => index);

      final artist = Artist(
        name: artistController.text,
        albums: albumControllers
            .mapWithIndex<Album>((index, controller) => Album(
                  name: controller.text,
                  songs: songControllers[index]
                      .text
                      .split(_splitPattern)
                      .map((song) => Song(
                            // Song names are in the same order as the albums, so removeAt(0) works.
                            name: songNames.removeAt(0),
                            // Select a random order number, and remove it from the list.
                            order: orderNumbers.removeAt(
                                Random().nextInt(orderNumbers.length)),
                          ))
                      .toList(),
                ))
            .toList(),
      );

      await _fileIO.saveArtist(artist);
    }
  }

  removeAlbum(int index) {
    albumControllers.removeAt(index);
    songControllers.removeAt(index);
    notifyListeners();
  }

  addAlbum() {
    albumControllers.add(TextEditingController());
    songControllers.add(TextEditingController());
    notifyListeners();
  }
}
