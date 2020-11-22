import 'dart:convert';

import 'package:open_weather_map/core/endpoints/endpoints.dart';
import 'package:open_weather_map/core/error/exceptions.dart';
import 'package:open_weather_map/core/http_client/http_client.dart';

import '../models/weather_info_model.dart';

abstract class OpenWeatherMapRemoteDatasource {
  /// Calls http://api.openweathermap.org/data/2.5/weather?q={cityName}&units=metric&appid={apiKey} endpoint
  ///
  /// Throws a [ServerException] for all error codes.
  Future<WeatherInfoModel> getWeatherInfoForCity(String cityName);
}

class OpenWeatherMapRemoteDatasourceImplementation
    implements OpenWeatherMapRemoteDatasource {
  final HttpClient httpClient;

  OpenWeatherMapRemoteDatasourceImplementation(this.httpClient);

  @override
  Future<WeatherInfoModel> getWeatherInfoForCity(String cityName) async {
    final response = await httpClient
        .get(kAPIHost + Endpoints.getWeatherInfoForCity(cityName));

    switch (response.statusCode) {
      case 200:
        return WeatherInfoModel.fromJSON(jsonDecode(response.data));
      default:
        throw ServerException();
    }
  }
}
