import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class WeatherInformation extends Equatable {
  final String cityName;
  final String country;
  final double currentTemperature;
  final String weatherDescription;

  WeatherInformation({
    @required this.cityName,
    @required this.country,
    @required this.currentTemperature,
    @required this.weatherDescription,
  });

  @override
  List<Object> get props => [
        cityName,
        country,
        currentTemperature,
        weatherDescription,
      ];
}
