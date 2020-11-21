import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

    return Future.value(WeatherInfoModel.fromJSON(jsonDecode(cachedWeather)));
  }

  @override
  Future<void> cacheWeatherInfo(WeatherInfoModel weatherInfo) {
    // TODO: implement cacheWeatherInfo

    // sharedPreferences.set
    throw UnimplementedError();
  }
}
