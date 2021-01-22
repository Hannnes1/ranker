import 'package:flutter/material.dart' hide Router;
import 'package:ranker/locator.dart';
import 'package:ranker/ui/view/home_view.dart';
import 'package:ranker/ui/router.dart';

void main() {
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute,
    );
  }
}
