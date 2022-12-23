import 'package:ranker/services/auth_service.dart';
import 'package:ranker/ui/view/home/home_view.dart';
import 'package:ranker/ui/view/profile/profile_view.dart';
import 'package:ranker/ui/view/sign_in/sign_in_view.dart';
import 'package:ranker/ui/view/sort/sort_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: SignInView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: SortView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
  ],
)
class AppConstants {}
