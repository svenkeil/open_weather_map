import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../controllers/app_controller.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
    @required TextEditingController textController,
    @required AppController appController,
  })  : _textController = textController,
        _appController = appController,
        super(key: key);

  final TextEditingController _textController;
  final AppController _appController;

  void _searchCity() async {
    await _appController.getWeatherInfoForCity(_textController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _textController,
            onSubmitted: (_) async => _searchCity(),
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
