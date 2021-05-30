import 'package:meta/meta.dart';

import '../../domain/entities/weather_information.dart';

abstract class OpenWeatherMapStates {
  const OpenWeatherMapStates();
}

class IdleState implements OpenWeatherMapStates {}

class FetchingDataState implements OpenWeatherMapStates {}

class UnableToFetchDataState implements OpenWeatherMapStates {}

class SuccessfullyLoadedDataState implements OpenWeatherMapStates {
  final WeatherInformation weatherInformation;

  SuccessfullyLoadedDataState({@required this.weatherInformation});
}
