import 'dart:async';

import 'package:ranker/services/file_io.dart';
import 'package:stacked/stacked.dart';
import 'package:ranker/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ranker/app/app.router.dart';

class HomeViewModel extends BaseViewModel {
  final FileIO _fileIO = locator<FileIO>();
  final NavigationService _navigationService = locator<NavigationService>();
  StreamController<List<Map>> artistController = StreamController<List<Map>>();

  void init() {
    loadArtists();
  }

  Future<void> loadArtists({String? remove}) async {
    final artists = <Map>[];
    List<String> artistNames;
    if (remove != null) {
      artistNames = await _fileIO.removeArtist(remove) ?? [];
    } else {
      artistNames = await _fileIO.readArtistNames();
    }
    for (final artist in artistNames) {
      artists.add(await _fileIO.readArtist(artist));
    }
    artistController.add(artists);
  }

  Future<void> goToComparison(Map artist) async {
    await _navigationService.navigateTo(Routes.comparisonView, arguments: ComparisonViewArguments(artist: artist));

    loadArtists();
  }

  Future<void> goToArtistInput() async {
    await _navigationService.navigateTo(Routes.artistInputView);

    loadArtists();
  }
}
