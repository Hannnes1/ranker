import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:ranker/app/app.locator.dart';
import 'package:ranker/app/app.router.dart';
import 'package:ranker/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignInViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();

  List<AuthProvider> get authProviders => _authService.providers;

  void onSignedIn(BuildContext context, SignedIn state) async {
    _navigationService.clearStackAndShow(Routes.homeView);
  }
}
