import 'dart:async';

import 'package:ranker/models/json.dart';
import 'package:ranker/services/file_io.dart';
import 'package:stacked/stacked.dart';
import 'package:ranker/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ranker/app/app.router.dart';

class HomeViewModel extends BaseViewModel {
  final FileIO _fileIO = locator<FileIO>();
  final NavigationService _navigationService = locator<NavigationService>();
  StreamController<List<Artist>> artistController = StreamController<List<Artist>>();

  void init() {
    loadArtists();
  }

  Future<void> loadArtists({String? remove}) async {
    final artists = <Artist>[];
    List<String> artistNames;

    if (remove != null) {
      artistNames = (await _fileIO.removeArtist(remove)).map((e) => e.name).toList();
    } else {
      artistNames = await _fileIO.readArtistNames();
    }
    for (final artist in artistNames) {
      artists.add(await _fileIO.readArtist(artist));
    }
    artistController.add(artists);
  }

  Future<void> goToComparison(Artist artist) async {
    await _navigationService.navigateTo(Routes.comparisonView, arguments: ComparisonViewArguments(artist: artist));

    loadArtists();
  }

  Future<void> goToArtistInput() async {
    await _navigationService.navigateTo(Routes.artistInputView);

    loadArtists();
  }
}
