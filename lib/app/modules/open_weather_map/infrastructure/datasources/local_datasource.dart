import '../../external/models/weather_info_model.dart';

abstract class LocalDatasource {
  Future<WeatherInfoModel> getLastCachedWeatherInfo();

  Future<void> cacheWeatherInfo(WeatherInfoModel weatherInfo);
}

const kCachedWeatherInfo = 'CACHED_WEATHER_INFO';
