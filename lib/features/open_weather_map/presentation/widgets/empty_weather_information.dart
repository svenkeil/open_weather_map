import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../controllers/app_controller.dart';

class EmptyWeatherInformation extends StatelessWidget {
  const EmptyWeatherInformation({
    Key key,
    @required AppController appController,
  })  : _appController = appController,
        super(key: key);

  final AppController _appController;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.28),
          Text(
            _appController.hasError ? 'An error ocurred' : 'No data avaliable',
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
