import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ranker/ui/view/artist_input_view.dart';
import 'package:ranker/ui/view/comparison_view.dart';
import 'package:ranker/ui/view/home_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
        break;
      case '/artistInput':
        return MaterialPageRoute(builder: (_) => ArtistInputView());
      case '/comparison':
        Map artist = settings.arguments;
        return MaterialPageRoute(builder: (_) => ComparisonView(artist: artist));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
