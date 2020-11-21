import 'dart:convert';

import 'package:mockito/mockito.dart';
import 'package:open_weather_map/core/error/exceptions.dart';
import 'package:open_weather_map/features/open_weather_map/data/datasources/local_datasource.dart';
import 'package:open_weather_map/features/open_weather_map/data/models/weather_info_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

import '../response_mock/cached_response.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  LocalDatasourceImplementation localDatasource;
  MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    localDatasource = LocalDatasourceImplementation(
      sharedPreferences: mockSharedPreferences,
    );
  });

  group('getLastCachedWeatherInfo', () {
    final tWeatherInfoModel = WeatherInfoModel.fromJSON(cachedReponse);

    test('should return the last cached weather info when there is one cached',
        () async {
      // Arrange
      when(mockSharedPreferences.getString(any))
          .thenReturn(jsonEncode(cachedReponse));

      // Act
      final result = await localDatasource.getLastCachedWeatherInfo();

      // Assert
      verify(mockSharedPreferences.getString(kCachedWeatherInfo));
      expect(result, tWeatherInfoModel);
    });

    test('should throw CacheException when there is not cached data', () {
      // Arrange
      when(mockSharedPreferences.getString(any)).thenReturn(null);

      // Act
      final call = localDatasource.getLastCachedWeatherInfo;

      // Assert
      expect(() => call(), throwsA(TypeMatcher<CacheException>()));
    });
  });

  group('cacheWeatherInfo', () {
    test('should call SharedPreferences to cache data', () {
      final tWeatherInfoModel = WeatherInfoModel(
          cityName: 'Fortaleza',
          country: 'BR',
          currentTemperature: 27.66,
          weatherDescription: 'broken clouds');

      // Act
      localDatasource.cacheWeatherInfo(tWeatherInfoModel);

      // Assert
      final encodedJSON = jsonEncode(tWeatherInfoModel.toJSON());
      verify(mockSharedPreferences.setString(kCachedWeatherInfo, encodedJSON));
    });
  });
}
