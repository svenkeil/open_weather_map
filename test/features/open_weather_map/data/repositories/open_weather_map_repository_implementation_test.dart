import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:open_weather_map/core/error/exceptions.dart';
import 'package:open_weather_map/core/error/failure.dart';
import 'package:open_weather_map/features/open_weather_map/data/datasources/local_datasource.dart';
import 'package:open_weather_map/features/open_weather_map/data/models/weather_info_model.dart';
import 'package:open_weather_map/features/open_weather_map/domain/entities/weather_information.dart';
import 'package:test/test.dart';

import 'package:open_weather_map/core/platform/network_info.dart';
import 'package:open_weather_map/features/open_weather_map/data/datasources/open_weather_map_remote_datasource.dart';
import 'package:open_weather_map/features/open_weather_map/data/repositories/open_weather_map_repository_implementation.dart';

class MockRemoteDatasource extends Mock
    implements OpenWeatherMapRemoteDatasource {}

class MockLocalDatasource extends Mock implements LocalDatasource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  OpenWeatherMapRepositoryImplementation repository;
  MockRemoteDatasource mockRemoteDatasource;
  MockLocalDatasource mockLocalDatasource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDatasource = MockRemoteDatasource();
    mockNetworkInfo = MockNetworkInfo();
    mockLocalDatasource = MockLocalDatasource();

    repository = OpenWeatherMapRepositoryImplementation(
      remoteDatasource: mockRemoteDatasource,
      localDatasource: mockLocalDatasource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('getWeatherInfoForCity', () {
    final tCity = 'Fortaleza';
    final tWeatherInfoModel = WeatherInfoModel(
      cityName: 'Fortaleza',
      country: 'BR',
      currentTemperature: 27.66,
      weatherDescription: 'broken clouds',
    );

    final WeatherInformation tWeatherInformation = tWeatherInfoModel;
    test('should check if the device has ative connection', () async {
      // Arrange
      when(mockNetworkInfo.hasActiveNetwork).thenAnswer((_) async => true);

      // Act
      final result = await repository.getWeatherInfoForCity(tCity);

      // Assert
      verify(mockNetworkInfo.hasActiveNetwork);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.hasActiveNetwork).thenAnswer((_) async => true);
      });

      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        // Arrange
        when(mockRemoteDatasource.getWeatherInfoForCity(any))
            .thenAnswer((_) async => tWeatherInfoModel);

        // Act
        final result = await repository.getWeatherInfoForCity(tCity);

        // Assert
        verify(mockRemoteDatasource.getWeatherInfoForCity(tCity));
        expect(result, right(tWeatherInfoModel));
        verifyNoMoreInteractions(mockRemoteDatasource);
      });

      test(
          'should cache data locally when the call to remote data source is successful',
          () async {
        // Arrange
        when(mockRemoteDatasource.getWeatherInfoForCity(any))
            .thenAnswer((_) async => tWeatherInfoModel);

        // Act
        final result = await repository.getWeatherInfoForCity(tCity);

        // Assert
        verify(mockRemoteDatasource.getWeatherInfoForCity(tCity));
        verify(mockLocalDatasource.cacheWeatherInfo(tWeatherInfoModel));
        expect(result, right(tWeatherInfoModel));
      });

      test(
          'should return server failure data when the call to remote data source is unsuccessful',
          () async {
        // Arrange
        when(mockRemoteDatasource.getWeatherInfoForCity(any))
            .thenThrow(ServerException());

        // Act
        final result = await repository.getWeatherInfoForCity(tCity);

        // Assert
        verify(mockRemoteDatasource.getWeatherInfoForCity(tCity));
        expect(result, left(ServerFailure()));
      });
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.hasActiveNetwork).thenAnswer((_) async => false);
      });

      test('should return last locally cached data when cached data is present',
          () async {
        // Arrange
        when(mockLocalDatasource.getLastCachedWeatherInfo())
            .thenAnswer((_) async => tWeatherInfoModel);

        // Act
        final result = await repository.getWeatherInfoForCity(tCity);

        // Assert
        verifyZeroInteractions(mockRemoteDatasource);
        verify(mockLocalDatasource.getLastCachedWeatherInfo());
        expect(result, right(tWeatherInfoModel));
        verifyNoMoreInteractions(mockLocalDatasource);
      });

      test('should return CacheFailure when there is not cached data',
          () async {
        // Arrange
        when(mockLocalDatasource.getLastCachedWeatherInfo())
            .thenThrow(CacheException());

        // Act
        final result = await repository.getWeatherInfoForCity(tCity);

        // Assert
        verifyZeroInteractions(mockRemoteDatasource);
        verify(mockLocalDatasource.getLastCachedWeatherInfo());
        expect(result, left(CacheFailure()));
        verifyNoMoreInteractions(mockLocalDatasource);
      });
    });
  });
}
