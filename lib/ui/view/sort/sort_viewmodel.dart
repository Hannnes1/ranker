import 'dart:async';
import 'dart:math';

import 'package:ranker/models/user_list.dart';
import 'package:stacked/stacked.dart';

class SortViewModel extends BaseViewModel {
  SortViewModel({
    required this.listId,
  });

  final StreamController<int> _selections = StreamController.broadcast();

  /// The ID of the list to sort.
  final String listId;

  ListItem? _item1;
  ListItem? _item2;

  String get value1 => _item1?.value ?? '';
  String get value2 => _item2?.value ?? '';

  int? _remainingComparisons;

  String get remainingComparisons => _remainingComparisons?.toString() ?? '';

  Future<void> init() async {
    final listDoc = userListsRef.doc(listId);
    final listToSort = (await listDoc.items.get()).docs.map((e) => e.data).toList();

    // Sort the list, and place items without an index last.
    listToSort.sort((a, b) {
      return a.index?.compareTo(b.index ?? double.maxFinite) ?? 1;
    });

    await _binaryInsertionSort(listToSort);

    _item1 = null;
    _item2 = null;
    notifyListeners();

    print(listToSort.map((e) => e.value));
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

  Future<void> _binaryInsertionSort(List<ListItem> list) async {
    final sortedCount = list.where((e) => e.index != null).length;

    // The lenght of the sorted list should always be at least one, since the first item
    // can be considered sorted, if all items are unsorted..
    for (var i = max(sortedCount, 1); i < list.length; i++) {
      final x = list[i];
      var left = 0;
      var right = i - 1;

      final unsortedLength = list.length - i;

      var splits = 0;
      // Find the index where x should be inserted
      while (left <= right) {
        // This is a rough estimation of the number of remaining comparisons.
        // It might not be the most correct way to do the estimation, but it is good enough.
        _remainingComparisons = (unsortedLength * (log(unsortedLength) / log(2))).round() + i ~/ 2 - splits++;

        final mid = (left + right) ~/ 2;

        _item1 = x;
        _item2 = list[mid];
        notifyListeners();

        late int selection;
        try {
          selection = await _selections.stream.first;
          // Will fail if the user leaves the page before a value is selected.
        } catch (e) {
          return;
        }

        if (selection < 0) {
          right = mid - 1;
        } else {
          left = mid + 1;
        }
      }

      // Shift elements to make room for x
      for (var j = i - 1; j >= left; j--) {
        list[j + 1] = list[j];
      }

      // Insert x at the correct position
      list[left] = x;

      await userListsRef.doc(listId).items.doc(x.id).update(index: left);
    }
  }
}
