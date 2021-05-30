import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/open_weather_map_controller.dart';
import '../events/open_weather_map_events.dart';
import '../states/open_weather_map_states.dart';
import '../widgets/empty_weather_information.dart';
import '../widgets/search_field.dart';
import '../widgets/weather_information.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final _openWeatherMapController = Modular.get<OpenWeatherMapController>();

    return StreamBuilder(
      stream: _openWeatherMapController,
      initialData: IdleState,
      builder: (context, snapshot) {
        final state = _openWeatherMapController.state;

        return Listener(
          onPointerDown: (_) {
            final currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
              currentFocus.focusedChild.unfocus();
            }
          },
          child: Scaffold(
            appBar: AppBar(
              brightness: Brightness.dark,
              title: Text(
                'Open Weather Map',
                style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
              ),
            ),
            body: Container(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SearchField(
                      onSearch: (cityName) => _openWeatherMapController.add(GetWeatherInfoForCityEvent(cityName: cityName)),
                    ),
                    if (state is SuccessfullyLoadedDataState) ...[
                      WeatherInformationWidget(weatherInformation: state.weatherInformation)
                    ] else if (state is UnableToFetchDataState) ...[
                      EmptyWeatherInformation(hasError: true)
                    ] else ...[
                      EmptyWeatherInformation()
                    ]
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
