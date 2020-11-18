import 'package:open_weather_map/features/open_weather_map/data/models/weather_info_model.dart';
import 'package:open_weather_map/features/open_weather_map/domain/entities/weather_information.dart';
import 'package:test/test.dart';

void main() {
  final tWeatherInfoModel = WeatherInfoModel(
    cityName: 'Fortaleza',
    country: 'BR',
    currentTemperature: 28.0,
    weatherDescription: 'Very hot',
  );

  test('should be a subclass of WeatherInformation entity', () async {
    // Assert
    expect(tWeatherInfoModel, isA<WeatherInformation>());
  });
}
