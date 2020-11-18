import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/weather_information.dart';
import '../../domain/repositories/open_weather_map_repository.dart';

class OpenWeatherMapRepositoryImplementation extends OpenWeatherMapRepository {
  @override
  Future<Either<Failure, WeatherInformation>> getWeatherInfoForCity(
      String cityName) {
    // TODO: implement getWeatherInfoForCity
    throw UnimplementedError();
  }
}
