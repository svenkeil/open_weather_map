import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/weather_information.dart';
import '../../domain/repositories/open_weather_map_repository.dart';
import '../datasources/local_datasource.dart';
import '../datasources/open_weather_map_remote_datasource.dart';

class OpenWeatherMapRepositoryImplementation extends OpenWeatherMapRepository {
  final OpenWeatherMapRemoteDatasource remoteDatasource;
  final LocalDatasource localDatasource;
  final NetworkInfo networkInfo;

  OpenWeatherMapRepositoryImplementation({
    @required this.remoteDatasource,
    @required this.localDatasource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, WeatherInformation>> getWeatherInfoForCity(
      String cityName) async {
    if (await networkInfo.hasActiveNetwork) {
      try {
        final result = await remoteDatasource.getWeatherInfoForCity(cityName);
        localDatasource.cacheWeatherInfo(result);
        return right(result);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      try {
        final result = await localDatasource.getLastCachedWeatherInfo();
        return right(result);
      } on CacheException {
        return left(CacheFailure());
      }
    }
  }
}
