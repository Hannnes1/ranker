import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List list = [];
  List<List> compared = [];
  int n = 0;
  Random rand = Random();

  swapItems(int low, int high) {
    int tmp = list[low];
    list[low] = list[high];
    list[high] = tmp;
  }

  // Check of the element with index low is higher than the element with
  // index high.
  //
  // This will be replaced with a user input later (Two buttons).
  compare(low, high) {
    n++;
    return list[low] > list[high];
  }

  partioning(int low, int high) {
    if (low >= high) {
      // Abort if the list is less than 2 items.
      return;
    }

    // If the list consists of two elements, compare them and swap if required.
    if (high - low == 1) {
      if (compare(low, high)) {
        swapItems(low, high);
      }
      return;
    }

    // Pivot element.
    int pivot = high;
    int i, j;

    // Loop until all elements in the first part (before where i and j stops) of
    // the list is lower than those in the upper part.
    do {
      // Move indexes towards pivot element.
      i = low;
      j = high;

      // Increase lower index until an element that is higher than the pivot
      // element is found.
      while ((i < j) && !compare(i, pivot)) {
        i++;
      }

      // Decrease upper index until an element that is lower than the pivot
      // element is found.
      while ((j > i) && compare(j, pivot)) {
        j--;
      }

      // Swap items if i is less than j. (They could be the same as the pivot
      // element and thus each other). Since the while loops moves until an
      // element that is higher respectively lower than the pivot element,it is
      // guaranteed that they will be in the wrong order comapred to each other.
      if (i < j) {
        swapItems(i, j);
      }
    } while (i < j);

    // Swap the element at the index where i and j stops with the pivot element
    // since the pivot element will be lowest element.
    swapItems(i, pivot);

    // Sort the parts above and below i recursively. Start with the smallest.
    if ((i - low) < (high - i)) {
      partioning(low, i - 1);
      partioning(i + 1, high);
    } else {
      partioning(i + 1, high);
      partioning(low, i - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(onPressed: null),
                RaisedButton(onPressed: null),
              ],
            ),
            RaisedButton(onPressed: () {
              n = 0;
              list = List.generate(17, (_) => rand.nextInt(10000));
              partioning(0, list.length - 1);
              print(n);
              print(list);
            })
          ],
        ),
      ),
    );
  }
}
