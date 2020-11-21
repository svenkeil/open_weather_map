import '../config/api_key.dart';

class Endpoints {
  static String getWeatherInfoForCity(String cityName) =>
      'http://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=$kAPIKey';
}
