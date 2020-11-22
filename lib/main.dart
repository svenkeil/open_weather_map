import 'package:flutter/material.dart';

import 'dependency_injection.dart';
import 'features/open_weather_map/presentation/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(OpenWeatherMap());
}

class OpenWeatherMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OpenWeatherMap',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
