import 'package:flutter/material.dart';
import 'package:open_weather_map/features/open_weather_map/presentation/theme/theme.dart';

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
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
