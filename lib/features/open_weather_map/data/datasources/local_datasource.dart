import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import '../models/weather_info_model.dart';

abstract class LocalDatasource {
  Future<WeatherInfoModel> getLastCachedWeatherInfo();

  Future<void> cacheWeatherInfo(WeatherInfoModel weatherInfo);
}

const kCachedWeatherInfo = 'CACHED_WEATHER_INFO';

class LocalDatasourceImplementation implements LocalDatasource {
  final SharedPreferences sharedPreferences;

  LocalDatasourceImplementation({@required this.sharedPreferences});

  @override
  Future<WeatherInfoModel> getLastCachedWeatherInfo() {
    final cachedWeather = sharedPreferences.getString(kCachedWeatherInfo);

    if (cachedWeather != null) {
      return Future.value(WeatherInfoModel.fromJSON(jsonDecode(cachedWeather)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheWeatherInfo(WeatherInfoModel weatherInfo) {
    return sharedPreferences.setString(
        kCachedWeatherInfo, jsonEncode(weatherInfo.toJSON()));
  }
}
