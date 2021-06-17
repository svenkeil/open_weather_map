import '../models/weather_info_model.dart';

abstract class OpenWeatherMapRemoteDatasource {
  /// Calls http://api.openweathermap.org/data/2.5/weather?q={cityName}&units=metric&appid={apiKey} endpoint
  ///
  /// Throws a [ServerException] for all error codes.
  Future<WeatherInfoModel> getWeatherInfoForCity(String cityName);
}
