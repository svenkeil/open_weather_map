import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:open_weather_map/features/open_weather_map/presentation/controllers/app_controller.dart';
import 'package:unicons/unicons.dart';
import '../../../../core/util/extensions.dart';

class HomePage extends StatelessWidget {
  var _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _appController = GetIt.I.get<AppController>();

    return Observer(
      builder: (_) {
        return Listener(
          onPointerDown: (_) {
            final currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null)
              currentFocus.focusedChild.unfocus();
          },
          child: Scaffold(
            appBar: AppBar(
                title: Text(
              'Open Weather Map',
            )),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _textController,
                            decoration: InputDecoration(
                              hintText: 'Type a city name here',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(color: Colors.grey[800]),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await _appController
                                .getWeatherInfoForCity(_textController.text);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Icon(UniconsLine.search),
                          ),
                        ),
                      ],
                    ),
                    _appController.hasData
                        ? WeatherInformation(appController: _appController)
                        : EmptyWeatherInformation(),
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

class EmptyWeatherInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 200.0),
        Text(
          'No data avaliable',
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: Colors.grey[800]),
        )
      ],
    );
  }
}

class WeatherInformation extends StatelessWidget {
  const WeatherInformation({
    Key key,
    @required AppController appController,
  })  : _appController = appController,
        super(key: key);

  final AppController _appController;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          children: [
            SizedBox(height: 120.0),
            Text(
              '${_appController.city}',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.grey[800]),
            ),
            SizedBox(height: 15.0),
            Text(
              '${_appController.currentTemperature.toInt()}ºC',
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(color: Colors.grey[800]),
            ),
            SizedBox(height: 15.0),
            Text(
              _appController.weatherDescription.capitalize(),
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
