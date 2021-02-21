import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../controllers/open_weather_map_controller.dart';

class EmptyWeatherInformation extends StatelessWidget {
  const EmptyWeatherInformation({
    Key key,
    @required OpenWeatherMapController openWeatherMapController,
  })  : _openWeatherMapController = openWeatherMapController,
        super(key: key);

  final OpenWeatherMapController _openWeatherMapController;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.28),
          Text(
            _openWeatherMapController.hasError
                ? 'An error ocurred'
                : 'No data avaliable',
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.grey[800]),
          ),
        ],
      );
    });
  }
}
