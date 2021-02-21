import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../controllers/open_weather_map_controller.dart';

class WeatherInformationWidget extends StatelessWidget {
  const WeatherInformationWidget({
    Key key,
    @required OpenWeatherMapController openWeatherMapController,
  })  : _openWeatherMapController = openWeatherMapController,
        super(key: key);

  final OpenWeatherMapController _openWeatherMapController;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            Text(
              '${_openWeatherMapController.city} - ${_openWeatherMapController.country}',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.grey[800]),
            ),
            SizedBox(height: 15.0),
            Text(
              '${_openWeatherMapController.currentTemperature.toInt()}ºC',
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(color: Colors.grey[800]),
            ),
            SizedBox(height: 15.0),
            Text(
              _openWeatherMapController.weatherDescription,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.grey[800]),
            ),
          ],
        );
      },
    );
  }
}
