import 'package:flutter/material.dart';

class EmptyWeatherInformation extends StatelessWidget {
  final bool hasError;

  const EmptyWeatherInformation({this.hasError = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.28),
        Text(
          hasError ? 'An error ocurred' : 'No data avaliable',
          style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.grey[800]),
        ),
      ],
    );
  }
}
