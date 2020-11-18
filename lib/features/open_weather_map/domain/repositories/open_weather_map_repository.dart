import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/weather_information.dart';

abstract class OpenWeatherMapRepository {
  Future<Either<Failure, WeatherInformation>> getWeatherInfoForCity(
    String cityName,
  );
}
