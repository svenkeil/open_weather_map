import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../controllers/app_controller.dart';
import '../widgets/empty_weather_information.dart';
import '../widgets/search_field.dart';
import '../widgets/weather_information.dart';

class HomePage extends StatelessWidget {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _appController = GetIt.I.get<AppController>();

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
              brightness: Brightness.dark,
              title: Text(
                'Open Weather Map',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.white),
              ),
            ),
            body: Container(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SearchField(
                      textController: _textController,
                      appController: _appController,
                    ),
                    _appController.hasData
                        ? WeatherInformationWidget(
                            appController: _appController)
                        : EmptyWeatherInformation(
                            appController: _appController),
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
