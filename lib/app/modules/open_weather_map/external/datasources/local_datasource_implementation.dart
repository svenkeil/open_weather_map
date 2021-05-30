import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import '../../infrastructure/datasources/local_datasource.dart';
import '../../infrastructure/models/weather_info_model.dart';

class LocalDatasourceImplementation implements LocalDatasource {
  SharedPreferences sharedPreferences;

  LocalDatasourceImplementation() {
    _getSharedPreferencesInstance();
  }

  Future<void> _getSharedPreferencesInstance() async => sharedPreferences = await SharedPreferences.getInstance();

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
    return sharedPreferences.setString(kCachedWeatherInfo, jsonEncode(weatherInfo.toJSON()));
  }
}
