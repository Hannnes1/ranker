import 'package:flutter/foundation.dart';
import 'package:ranker/models/json.dart';
import 'package:ranker/services/file_io.dart';
import 'package:stacked/stacked.dart';
import 'package:ranker/app/app.locator.dart';

class ComparisonViewModel extends BaseViewModel {
  ComparisonViewModel(this.artist) : _winHistory = List<String>.from(artist.winHistory);

  final FileIO _fileIO = locator<FileIO>();

  /// The song in the left button.
  late String song1;

  /// The song in the right button.
  late String song2;

  /// The number of comparisons that have been shown to the user.
  int comparisonCount = 0;

  /// The artist with the songs to sort.
  final Artist artist;

  String get progress => '$comparisonCount/${comparisonCount + unsorted}';

  /// Get all of the songs as a flat list.
  ///
  /// This list is sorted according to the randomized order numbers.
  List<Song> get songs {
    _songs ??= artist.albums.expand((album) => album.songs).toList()..sort((a, b) => a.order.compareTo(b.order));

    return _songs!;
  }

  List<Song>? _songs;

  List<Song>? _sortedSongs;

  List<Song> get sortedSongs {
    _sortedSongs ??= songs..sort((a, b) => ((a.position ?? 0) > (b.position ?? 0)) ? 1 : -1);

    return _sortedSongs!;
  }

  /// The history of songs that the user has selected.
  ///
  /// Since the list that mergeSort uses will be the same each time,
  /// this history can be used to sort the songs without user input.
  final List<String> _winHistory;

  /// Number of songs that haven't been sorted yet.
  int unsorted = 0;

  /// Get the first songs to compare.
  void init() {
    comparisonCount = _winHistory.length;
    _getNewSongs();
  }

  /// Sort has long as sortCount is less than `_winHistory.length`, then get two new songs.
  _getNewSongs() {
    comparisonCount++;

    // The number of comparisons the mergeSort function have done.
    var sortCount = 0;

    // Reset unsorted each time getNewSongs is called.
    unsorted = 0;

    // Create a temporary list to sort, so that the original list is unchanged.
    final sortingList = List<String>.from(songs.map((song) => song.name));

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
    var updatedArtist = artist;

    // Create a new artist with updated song positions, if any.
    if (sortedList != null) {
      updatedArtist = artist.copyWith(
          winHistory: _winHistory,
          albums: artist.albums
              .map((e) => e.copyWith(
                    songs: e.songs.map((e) => e.copyWith(position: sortedList.indexOf(e.name))).toList(),
                  ))
              .toList());
    }else{
      updatedArtist = artist.copyWith(winHistory: _winHistory);
    }

    _fileIO.saveArtist(updatedArtist);
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
