import 'package:open_weather_map/app/modules/open_weather_map/infrastructure/models/weather_info_model.dart';

abstract class LocalDatasource {
  Future<WeatherInfoModel> getLastCachedWeatherInfo();

  Future<void> cacheWeatherInfo(WeatherInfoModel weatherInfo);
}

const kCachedWeatherInfo = 'CACHED_WEATHER_INFO';
