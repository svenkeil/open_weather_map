import 'package:meta/meta.dart';

import '../../domain/entities/weather_information.dart';

class WeatherInfoModel extends WeatherInformation {
  WeatherInfoModel({
    @required String cityName,
    @required String country,
    @required double currentTemperature,
    @required String weatherDescription,
  }) : super(
          cityName: cityName,
          country: country,
          currentTemperature: currentTemperature,
          weatherDescription: weatherDescription,
        );
}
