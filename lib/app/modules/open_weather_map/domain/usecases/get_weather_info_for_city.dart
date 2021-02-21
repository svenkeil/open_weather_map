import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/weather_information.dart';
import '../repositories/open_weather_map_repository.dart';

part 'get_weather_info_for_city.g.dart';

@Injectable()
class GetWeatherInfoForCity implements Usecase<WeatherInformation, Params> {
  final OpenWeatherMapRepository repository;

  GetWeatherInfoForCity(this.repository);

  Future<Either<Failure, WeatherInformation>> call(Params params) async {
    if (params.cityName != null && params.cityName != '') {
      return await repository.getWeatherInfoForCity(params.cityName);
    }

    return left(CityNameFailure());
  }
}

class Params extends Equatable {
  final String cityName;
  Params({@required this.cityName});

  List<Object> get props => [cityName];
}
