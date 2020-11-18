import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failure.dart';
import '../entities/weather_information.dart';
import '../repositories/open_weather_map_repository.dart';

class GetWeatherInfoForCity {
  final OpenWeatherMapRepository repository;

  GetWeatherInfoForCity(this.repository);

  Future<Either<Failure, WeatherInformation>> call(
      {@required String cityName}) async {
    return await repository.getWeatherInfoForCity(cityName);
  }
}
