import 'package:ranker/services/file_io.dart';
import 'package:ranker/ui/view/artist_input/artist_input_view.dart';
import 'package:ranker/ui/view/comparison/comparison_view.dart';
import 'package:ranker/ui/view/home/home_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(
    page: HomeView,
    initial: true,
  ),
  MaterialRoute(
    page: ComparisonView,
  ),
  MaterialRoute(
    page: ArtistInputView,
  ),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: FileIO),
])
class AppSetup {}
