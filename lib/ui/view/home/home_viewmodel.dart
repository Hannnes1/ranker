import 'package:ranker/app/app.locator.dart';
import 'package:ranker/app/app.router.dart';
import 'package:ranker/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();

  bool get signedIn => _authService.currentUser != null;

  Future<void> signIn() async {
    await _navigationService.navigateToSignInView();
  }

  Future<void> openProfile() async {
    await _navigationService.navigateToProfileView();
  }

  Future<void> openSort() async {
    await _navigationService.navigateToSortView();
  }
}
