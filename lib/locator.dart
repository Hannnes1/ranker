import 'package:get_it/get_it.dart';
import 'package:ranker/services/file_io.dart';
import 'package:ranker/viewmodels/artist_input_model.dart';
import 'package:ranker/viewmodels/comparison_model.dart';
import 'package:ranker/viewmodels/home_model.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => FileIO());

  locator.registerLazySingleton(() => HomeModel());
  locator.registerFactory(() => ComparisonModel());
  locator.registerFactory(() => ArtistInputModel());
}
