import 'package:flutter/foundation.dart';
import 'package:ranker/services/file_io.dart';
import 'package:stacked/stacked.dart';
import 'package:ranker/app/app.locator.dart';

class ComparisonViewModel extends BaseViewModel {
  ComparisonViewModel(this.artist);

  final FileIO _fileIO = locator<FileIO>();

  /// The song in the left button.
  late String song1;

  /// The song in the right button.
  late String song2;

  /// The number of comparisons that have been shown to the user.
  int comparisonCount = 0;

  /// The history of songs that the user has selected.
  ///
  /// Since the list that mergeSort uses will be the same each time,
  /// this history can be used to sort the songs without user input.
  List<String> _winHistory = [];

  /// The artist with the songs to sort.
  final Map artist;

  /// Number of songs that haven't been sorted yet.
  int unsorted = 0;

  /// Save the artist and get the first songs to compare.
  void init() {
    setBusy(true);
    _winHistory = artist['winHistory'].map<String>((song) => song as String).toList();
    _getNewSongs();
    setBusy(false);
  }

  /// Sort has long as sortCount is less than `_winHistory.length`, then get two new songs.
  _getNewSongs() {
    comparisonCount++;

    // The number of comparisons the mergeSort function have done.
    var sortCount = 0;

    // Reset unsorted each time getNewSongs is called.
    unsorted = 0;

    // Create a temporary list to sort, so that the original list is unchanged.
    final sortingList = <String>[];
    for (final song in artist['songs'].keys.toList()) {
      sortingList.add(song);
    }

    // Sort songs by comparing the songs in _winHistory with a and b, then get two new songs
    mergeSort<String>(sortingList, compare: (a, b) {
      if (sortCount < _winHistory.length) {
        if (_winHistory[sortCount] == a) {
          sortCount++;
          return 1;
        } else if (_winHistory[sortCount] == b) {
          sortCount++;
          return -1;
        }
      } else if (sortCount == _winHistory.length) {
        song1 = a;
        song2 = b;
      }
      sortCount++;
      unsorted++;
      // Return an arbitrary value when _winHistory has no more songs.
      return -1;
    });
    // All songs have been sorted.
    if (unsorted == 0) {
      // Save the sorted songs.
      saveProgress(sortedList: sortingList);
    }
  }

  /// Save artist along with the history of songs that have been selected by the user.
  ///
  /// When the user comes back the history of winners can be loaded again to prevent loss of progress.
  /// If all songs have been sorted, pass in that list as `sortedList` to save the position of each song.
  saveProgress({List<String>? sortedList}) {
    // Add songs to the type of map that is required by the function that saves the artist to a file.
    final songs = <String, Map<String, String?>>{};
    for (var i = 0; i < artist['songs'].keys.length; i++) {
      final String song = artist['songs'].keys.toList()[i];
      songs[song] = {
        'album': artist['songs'][song]['album'],
        // Save the songs position in the fully sorted list of songs if it exist.
        'position': sortedList?.reversed.toList().indexOf(song).toString(),
      };
    }
    _fileIO.saveArtist(artist['artist'], artist['albums'].cast<String>(), songs, _winHistory);
  }

  /// Register `selection` as the winner and use that to sort all the songs.
  sort(String selection) {
    _winHistory.add(selection);
    _getNewSongs();
    notifyListeners();
  }

  undo() {
    if (_winHistory.isNotEmpty) {
      _winHistory.removeLast();
      _getNewSongs();
    }
  }
}
