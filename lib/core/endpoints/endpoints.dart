import '../config/api_key.dart';

const kAPIHost = 'https://api.openweathermap.org/';

class Endpoints {
  static String getWeatherInfoForCity(String cityName) =>
      '${kAPIHost}data/2.5/weather?q=$cityName&units=metric&appid=$kAPIKey';
}
