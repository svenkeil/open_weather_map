import 'package:open_weather_map/features/open_weather_map/data/models/weather_info_model.dart';
import 'package:open_weather_map/features/open_weather_map/domain/entities/weather_information.dart';
import 'package:test/test.dart';

import '../response_mock/city_info_mock.dart';

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

  test('should return a valid model from a json response', () {
    // Arrange
    final json = cityInfoMock;

    // Act
    final result = WeatherInfoModel.fromJSON(json);

    // Assert
    expect(result, tWeatherInfoModel);
  });
}
