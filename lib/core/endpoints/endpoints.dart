import '../config/api_key.dart';

const kAPIHost = 'http://api.openweathermap.org/';

class Endpoints {
  static String getWeatherInfoForCity(String cityName) =>
      'data/2.5/weather?q=$cityName&units=metric&appid=$kAPIKey';
}
