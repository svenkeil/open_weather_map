import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../controllers/open_weather_map_controller.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
    @required TextEditingController textController,
    @required OpenWeatherMapController openWeatherMapController,
  })  : _textController = textController,
        _openWeatherMapController = openWeatherMapController,
        super(key: key);

  final TextEditingController _textController;
  final OpenWeatherMapController _openWeatherMapController;

  void _searchCity() async {
    await _openWeatherMapController.getWeatherInfoForCity(_textController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _textController,
            onSubmitted: (_) async => _searchCity(),
            onChanged: (_) async => _searchCity(),
            textInputAction: TextInputAction.search,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: GestureDetector(
                onTap: _searchCity,
                child: Padding(
                  padding: const EdgeInsets.only(right: 2.0),
                  child: Icon(UniconsLine.search),
                ),
              ),
              hintText: 'Type a city name here',
              hintStyle: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Colors.grey[800]),
            ),
          ),
        ),
      ],
    );
  }
}
