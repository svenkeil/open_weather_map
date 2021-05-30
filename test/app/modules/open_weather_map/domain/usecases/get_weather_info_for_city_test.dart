import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:open_weather_map/app/core/error/failure.dart';
import 'package:open_weather_map/app/modules/open_weather_map/domain/entities/weather_information.dart';
import 'package:open_weather_map/app/modules/open_weather_map/domain/repositories/open_weather_map_repository.dart';
import 'package:open_weather_map/app/modules/open_weather_map/domain/usecases/get_weather_info_for_city.dart';

class MockOpenWeatherMapRepository extends Mock implements OpenWeatherMapRepository {}

void main() {
  GetWeatherInfoForCity usecase;
  OpenWeatherMapRepository mockOpenWeatherMapRepository;

  setUp(() {
    mockOpenWeatherMapRepository = MockOpenWeatherMapRepository();
    usecase = GetWeatherInfoForCity(mockOpenWeatherMapRepository);
  });

  final tCity = 'Fortaleza';
  final tWeatherInformation = WeatherInformation(
    cityName: 'Fortaleza',
    country: 'BR',
    currentTemperature: 27.66,
    weatherDescription: 'broken clouds',
  );

  test('should get weather information for city from the repository if city name is valid', () async {
    // Arrange
    when(mockOpenWeatherMapRepository.getWeatherInfoForCity(any)).thenAnswer((_) async => right(tWeatherInformation));

    // Act
    final result = await usecase(Params(cityName: tCity));

    // Assert
    expect(result, right(tWeatherInformation));
    verify(mockOpenWeatherMapRepository.getWeatherInfoForCity(tCity));
    verifyNoMoreInteractions(mockOpenWeatherMapRepository);
  });

  test('should return CityNameFailure if city name is not valid', () async {
    // Arrange
    when(mockOpenWeatherMapRepository.getWeatherInfoForCity(any)).thenAnswer((_) async => left(CityNameFailure()));

    // Act
    final result = await usecase(Params(cityName: null));

    // Assert
    expect(result, left(CityNameFailure()));
  });
}
