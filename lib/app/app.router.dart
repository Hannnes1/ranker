// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i7;
import 'package:flutter/material.dart';
import 'package:ranker/ui/view/home/home_view.dart' as _i2;
import 'package:ranker/ui/view/import/import_view.dart' as _i6;
import 'package:ranker/ui/view/profile/profile_view.dart' as _i4;
import 'package:ranker/ui/view/sign_in/sign_in_view.dart' as _i3;
import 'package:ranker/ui/view/sort/sort_view.dart' as _i5;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i8;

class Routes {
  static const homeView = '/';

  static const signInView = '/sign-in-view';

  static const profileView = '/profile-view';

  static const sortView = '/sort-view';

  static const importView = '/import-view';

  static const all = <String>{
    homeView,
    signInView,
    profileView,
    sortView,
    importView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.signInView,
      page: _i3.SignInView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i4.ProfileView,
    ),
    _i1.RouteDef(
      Routes.sortView,
      page: _i5.SortView,
    ),
    _i1.RouteDef(
      Routes.importView,
      page: _i6.ImportView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.SignInView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.SignInView(),
        settings: data,
      );
    },
    _i4.ProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.ProfileView(),
        settings: data,
      );
    },
    _i5.SortView: (data) {
      final args = data.getArgs<SortViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i5.SortView(key: args.key, listId: args.listId),
        settings: data,
      );
    },
    _i6.ImportView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.ImportView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class SortViewArguments {
  const SortViewArguments({
    this.key,
    required this.listId,
  });

  final _i7.Key? key;

  final String listId;
}

extension NavigatorStateExtension on _i8.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignInView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signInView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSortView({
    _i7.Key? key,
    required String listId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.sortView,
        arguments: SortViewArguments(key: key, listId: listId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToImportView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.importView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
