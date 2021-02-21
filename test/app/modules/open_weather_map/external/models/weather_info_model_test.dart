import 'dart:convert';

import 'package:open_weather_map/app/modules/open_weather_map/domain/entities/weather_information.dart';
import 'package:open_weather_map/app/modules/open_weather_map/external/models/weather_info_model.dart';
import 'package:test/test.dart';

import '../response_mock/api_response.dart';
import '../response_mock/cached_response.dart';

void main() {
  final tWeatherInfoModel = WeatherInfoModel(
    cityName: 'Fortaleza',
    country: 'BR',
    currentTemperature: 27.66,
    weatherDescription: 'broken clouds',
  );

  test('should be a subclass of WeatherInformation entity', () async {
    // Assert
    expect(tWeatherInfoModel, isA<WeatherInformation>());
  });

  group('json serialization', () {
    test('should return a valid model from a json response', () {
      // Arrange
      final json = apiResponse;

      // Act
      final result = WeatherInfoModel.fromJSON(jsonDecode(json));

      // Assert
      expect(result, tWeatherInfoModel);
    });

    test('should return a valid json from a model', () {
      // Arrange
      final json = jsonDecode(cachedReponse);

      // Act
      final result = tWeatherInfoModel.toJSON();

      // Assert
      expect(result, json);
    });
  });

  test('should be a subclass of WeatherInformation entity', () async {
    // Assert
    expect(tWeatherInfoModel, isA<WeatherInformation>());
  });
}
