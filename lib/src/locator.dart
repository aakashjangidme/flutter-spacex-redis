import 'package:get_it/get_it.dart';

import 'core/networking/api_base_helper.dart';
import 'core/networking/api_base_helper_impl.dart';
import 'core/repositories/dummy_repository.dart';



final GetIt locator = GetIt.instance;

/// Setup function that is run before the App is run.
///   - Sets up singletons that can be called from anywhere
/// in the app by using locator<Service>() call.
///   - Also sets up factor methods for view models.
/// Register like
/// `locator.registerLazySingleton<HttpService>(() => HttpServiceImpl());`
/// Use like
/// `final _httpService = locator<HttpService>();`
Future<void> setupLocator() async {
  /// [Services]

  /// `final _httpService = locator<HttpService>();`
  locator.registerLazySingleton<HttpService>(() => HttpServiceImpl());

  locator.registerLazySingleton<MovieRepository>(() => MovieRepository());
}
