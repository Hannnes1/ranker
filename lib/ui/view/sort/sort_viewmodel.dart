import 'dart:async';
import 'dart:math';

import 'package:stacked/stacked.dart';

class SortViewModel extends BaseViewModel {
  final StreamController<int> _selections = StreamController.broadcast();

  String? _value1;
  String? _value2;

  String get value1 => _value1 ?? '';
  String get value2 => _value2 ?? '';

  int? _remainingComparisons;

  String get remainingComparisons => _remainingComparisons?.toString() ?? '';

  Future<void> init() async {
    final array = [5, 8, 1, 0, 3, 9, 21, 10, 4, 100, 50, 80, 40];

    await _binaryInsertionSort(array);

    _value1 = null;
    _value2 = null;
    notifyListeners();

    print(array);
  }

  @override
  void dispose() {
    _selections.close();
    super.dispose();
  }

  /// Add a selected value to the stream of comparison selections.
  ///
  /// The value should be either -1, 0 or 1.
  void select(int selection) {
    _selections.add(selection);
  }

  Future<void> _binaryInsertionSort(List<int> array) async {
    for (int i = 1; i < array.length; i++) {
      int x = array[i];
      int left = 0;
      int right = i - 1;

      final unsortedLength = array.length - i;

      int splits = 0;
      // Find the index where x should be inserted
      while (left <= right) {
        _remainingComparisons = (unsortedLength * (log(unsortedLength) / log(2))).round() + i ~/ 2 - ++splits;

        int mid = (left + right) ~/ 2;

        _value1 = x.toString();
        _value2 = array[mid].toString();
        notifyListeners();

        late int selection;
        try {
          selection = await _selections.stream.first;
          // Will fail if the user leaves the page before a value is selected. Safe to ignore.
          // ignore: empty_catches
        } catch (e) {}

        if (selection < 0) {
          right = mid - 1;
        } else {
          left = mid + 1;
        }
      }

      // Shift elements to make room for x
      for (int j = i - 1; j >= left; j--) {
        array[j + 1] = array[j];
      }

      // Insert x at the correct position
      array[left] = x;
    }
  }
}
