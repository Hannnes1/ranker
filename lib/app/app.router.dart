// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../models/json.dart';
import '../ui/view/artist_input/artist_input_view.dart';
import '../ui/view/comparison/comparison_view.dart';
import '../ui/view/home/home_view.dart';

class Routes {
  static const String homeView = '/';
  static const String comparisonView = '/comparison-view';
  static const String artistInputView = '/artist-input-view';
  static const all = <String>{
    homeView,
    comparisonView,
    artistInputView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.comparisonView, page: ComparisonView),
    RouteDef(Routes.artistInputView, page: ArtistInputView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    ComparisonView: (data) {
      var args = data.getArgs<ComparisonViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => ComparisonView(
          key: args.key,
          artist: args.artist,
        ),
        settings: data,
      );
    },
    ArtistInputView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ArtistInputView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ComparisonView arguments holder class
class ComparisonViewArguments {
  final Key? key;
  final Artist artist;
  ComparisonViewArguments({this.key, required this.artist});
}
