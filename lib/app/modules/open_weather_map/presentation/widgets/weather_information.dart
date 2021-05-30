import 'package:flutter/material.dart';

import '../../../../core/util/extensions.dart';
import '../../domain/entities/weather_information.dart';

class WeatherInformationWidget extends StatelessWidget {
  final WeatherInformation weatherInformation;

  const WeatherInformationWidget({this.weatherInformation});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.15),
        Text(
          '${weatherInformation.cityName} - ${weatherInformation.country}',
          style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.grey[800]),
        ),
        SizedBox(height: 15.0),
        Text(
          '${weatherInformation.currentTemperature.toInt()}ºC',
          style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.grey[800]),
        ),
        SizedBox(height: 15.0),
        Text(
          weatherInformation.weatherDescription.capitalize(),
          style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.grey[800]),
        ),
      ],
    );
  }
}
