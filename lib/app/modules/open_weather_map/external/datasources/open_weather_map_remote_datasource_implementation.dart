import 'dart:convert';

import '../../../../core/endpoints/endpoints.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/http_client/http_client.dart';
import '../../infrastructure/datasources/open_weather_map_remote_datasource.dart';
import '../../infrastructure/models/weather_info_model.dart';

class OpenWeatherMapRemoteDatasourceImplementation implements OpenWeatherMapRemoteDatasource {
  final HttpClient httpClient;

  OpenWeatherMapRemoteDatasourceImplementation(this.httpClient);

  @override
  Future<WeatherInfoModel> getWeatherInfoForCity(String cityName) async {
    final response = await httpClient.get(Endpoints.getWeatherInfoForCity(cityName));

    switch (response.statusCode) {
      case 200:
        return WeatherInfoModel.fromJSON(jsonDecode(response.data));
      default:
        throw ServerException();
    }
  }
}
