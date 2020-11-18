import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:open_weather_map/features/open_weather_map/domain/entities/weather_information.dart';
import 'package:open_weather_map/features/open_weather_map/domain/usecases/get_weather_info_for_city.dart';
import 'package:test/test.dart';

import 'package:open_weather_map/features/open_weather_map/domain/repositories/open_weather_map_repository.dart';

class MockOpenWeatherMapRepository extends Mock
    implements OpenWeatherMapRepository {}

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
    currentTemperature: 28.0,
    weatherDescription: 'Very hot',
  );

  test('should get weather information for city from the repository', () async {
    // Arrange
    when(mockOpenWeatherMapRepository.getWeatherInfoForCity(any))
        .thenAnswer((_) async => right(tWeatherInformation));

    // Act
    final result = await usecase(Params(cityName: tCity));

    // Assert
    expect(result, right(tWeatherInformation));
    verify(mockOpenWeatherMapRepository.getWeatherInfoForCity(tCity));
    verifyNoMoreInteractions(mockOpenWeatherMapRepository);
  });
}