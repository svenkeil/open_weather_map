import 'package:mockito/mockito.dart';
import 'package:open_weather_map/core/config/api_key.dart';
import 'package:open_weather_map/core/error/exceptions.dart';
import 'package:open_weather_map/core/http_client/http_client.dart';
import 'package:open_weather_map/features/open_weather_map/data/datasources/open_weather_map_remote_datasource.dart';
import 'package:open_weather_map/features/open_weather_map/data/models/weather_info_model.dart';
import 'package:test/test.dart';

import '../response_mock/api_response.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  MockHttpClient httpClient;
  OpenWeatherMapRemoteDatasource remoteDatasource;

  setUp(() {
    httpClient = MockHttpClient();
    remoteDatasource = OpenWeatherMapRemoteDatasourceImplementation(httpClient);
  });

  void succesfulResponse() {
    when(httpClient.get(any)).thenAnswer(
      (_) async => HttpResponse(
        data: apiResponse,
        statusCode: 200,
      ),
    );
  }

  group('getWeatherInfoForCity', () {
    String tCity;

    setUpAll(() {
      tCity = 'Fortaleza';
    });

    test('should call GET method from httpClient with correct URL', () async {
      // Arrange
      final endpoint =
          'http://api.openweathermap.org/data/2.5/weather?q=$tCity&units=metric&appid=$kAPIKey';

      succesfulResponse();

      // Act
      await remoteDatasource.getWeatherInfoForCity(tCity);

      // Assert
      verify(httpClient.get(endpoint));
    });

    test('should return WeatherInfoModel from response if status code is 200',
        () async {
      // Arrange
      final tWeatherInfoModel = WeatherInfoModel(
          cityName: 'Fortaleza',
          country: 'BR',
          currentTemperature: 27.66,
          weatherDescription: 'broken clouds');

      succesfulResponse();

      // Act
      final result = await remoteDatasource.getWeatherInfoForCity(tCity);

      // Assert
      verify(httpClient.get(any));
      expect(result, tWeatherInfoModel);
    });

    test('should throw ServerException if status code is not 200', () async {
      // Arrange
      when(httpClient.get(any)).thenAnswer(
        (_) async => HttpResponse(data: null, statusCode: 500),
      );

      // Act
      final call = remoteDatasource.getWeatherInfoForCity;

      // Assert
      expect(() => call(tCity), throwsA(TypeMatcher<ServerException>()));
    });
  });
}
