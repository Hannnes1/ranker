import 'dart:math';

import 'package:flutter/foundation.dart';
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
  int n = 0;
  Random rand = Random();

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
              mergeSort(list, compare: (a, b) {
                n++;
                if (a > b) {
                  return 1;
                } else if (a == b) {
                  return 0;
                } else {
                  return -1;
                }
              });
              print(list);
              print(n);
            })
          ],
        ),
      ),
    );
  }
}
