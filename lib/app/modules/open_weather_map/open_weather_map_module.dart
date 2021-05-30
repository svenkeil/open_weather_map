import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

import '../../core/http_client/http_client_implementation.dart';
import '../../core/network/network_info_implementation.dart';
import 'domain/usecases/get_weather_info_for_city.dart';
import 'external/datasources/local_datasource_implementation.dart';
import 'external/datasources/open_weather_map_remote_datasource_implementation.dart';
import 'infrastructure/repositories/open_weather_map_repository_implementation.dart';
import 'presentation/controllers/open_weather_map_controller.dart';
import 'presentation/pages/home_page.dart';

class OpenWeatherMapModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => DataConnectionChecker()),
        Bind((i) => OpenWeatherMapController(i())),
        Bind((i) => GetWeatherInfoForCity(i())),
        Bind((i) => OpenWeatherMapRepositoryImplementation(i(), i(), i())),
        Bind((i) => OpenWeatherMapRemoteDatasourceImplementation(i())),
        Bind((i) => LocalDatasourceImplementation()),
        Bind((i) => NetworkInfoImplementation(i())),
        Bind((i) => HttpClientImplementation(http.Client())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<OpenWeatherMapModule>.of();
}
