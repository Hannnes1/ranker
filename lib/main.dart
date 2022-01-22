import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ranker/app/app.router.dart';
import 'package:ranker/app/app.locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ranker',
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
