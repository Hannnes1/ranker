import 'package:flutter/foundation.dart';
import 'package:ranker/enums/view_state.dart';
import 'package:ranker/locator.dart';
import 'package:ranker/services/file_io.dart';
import 'package:ranker/viewmodels/base_model.dart';

class ComparisonModel extends BaseModel {
  final FileIO _fileIO = locator<FileIO>();

  /// The song in the left button.
  String song1;

  /// The song in the right button.
  String song2;

  /// The number of comparisons that have been shown to the user.
  int comparisonCount = 0;

  /// The history of songs that the user has selected.
  ///
  /// Since the list that mergeSort uses will be the same each time,
  /// this history can be used to sort the songs without user input.

  List<String> _winHistory = [];

  /// The artist with the songs to sort.
  Map _artist;

  /// Number of songs that haven't been sorted yet.
  int unsorted = 0;

  /// Save the artist and get the first songs to compare.
  void init(Map artist) {
    setState(ViewState.Busy);
    _artist = artist;
    _winHistory = artist['winHistory'].map<String>((song) => song as String).toList();
    _getNewSongs();
  }

  /// Sort has long as sortCount is less than `_winHistory.length`, then get two new songs.
  _getNewSongs() {
    setState(ViewState.Busy);
    comparisonCount++;

    // The number of comparisons the mergeSort function have done.
    int sortCount = 0;

    // Reset unsorted each time getNewSongs is called.
    unsorted = 0;

    // Create a temporary list to sort, so that the original list is unchanged.
    List<String> sortingList = [];
    for (String song in _artist['songs'].keys.toList()) {
      sortingList.add(song);
    }

    // Sort songs by comparing the songs in _winHistory with a and b, then get two new songs
    mergeSort(sortingList, compare: (a, b) {
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
        setState(ViewState.Idle);
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
      setState(ViewState.Idle);
    }
  }

  /// Save artist along with the history of songs that have been selected by the user.
  ///
  /// When the user comes back the history of winners can be loaded again to prevent loss of progress.
  /// If all songs have been sorted, pass in that list as `sortedList` to save the position of each song.
  saveProgress({List<String> sortedList}) {
    // Add songs to the type of map that is required by the function that saves the artist to a file.
    Map<String, Map<String, String>> songs = {};
    for (int i = 0; i < _artist['songs'].keys.length; i++) {
      String song = _artist['songs'].keys.toList()[i];
      songs[song] = {
        'album': _artist['songs'][song]['album'],
        // Save the songs position in the fully sorted list of songs if it exist.
        'position': sortedList?.reversed?.toList()?.indexOf(song)?.toString(),
      };
    }
    _fileIO.saveArtist(_artist['artist'], _artist['albums'].cast<String>(), songs, _winHistory);
  }

  /// Register `selection` as the winner and use that to sort all the songs.
  sort(String selection) {
    _winHistory.add(selection);
    _getNewSongs();
  }

  undo() {
    if (_winHistory.isNotEmpty) {
      _winHistory.removeLast();
      _getNewSongs();
    }
  }
}
