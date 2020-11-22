import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/http_client/http_client.dart';
import 'core/network/network_info.dart';
import 'features/open_weather_map/data/datasources/local_datasource.dart';
import 'features/open_weather_map/data/datasources/open_weather_map_remote_datasource.dart';
import 'features/open_weather_map/data/repositories/open_weather_map_repository_implementation.dart';
import 'features/open_weather_map/domain/repositories/open_weather_map_repository.dart';
import 'features/open_weather_map/domain/usecases/get_weather_info_for_city.dart';
import 'features/open_weather_map/presentation/controllers/app_controller.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  getIt.registerLazySingleton(() => DataConnectionChecker());

  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplementation(getIt()));

  getIt.registerLazySingleton<LocalDatasource>(
      () => LocalDatasourceImplementation(sharedPreferences: getIt()));

  getIt.registerLazySingleton<HttpClient>(() => HttpClientImplementation());

  getIt.registerLazySingleton<OpenWeatherMapRemoteDatasource>(
      () => OpenWeatherMapRemoteDatasourceImplementation(getIt()));

  getIt.registerLazySingleton<OpenWeatherMapRepository>(
    () => OpenWeatherMapRepositoryImplementation(
      localDatasource: getIt(),
      networkInfo: getIt(),
      remoteDatasource: getIt(),
    ),
  );

  getIt.registerLazySingleton(() => GetWeatherInfoForCity(getIt()));

  getIt.registerSingleton<AppController>(AppController(getIt()));
}
