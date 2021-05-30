import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class SearchField extends StatelessWidget {
  final Function(String searchText) onSearch;

  const SearchField({this.onSearch});

  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();

    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _textController,
            onSubmitted: (_) async => onSearch(_textController.text),
            textInputAction: TextInputAction.search,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: GestureDetector(
                onTap: () => onSearch(_textController.text),
                child: Padding(
                  padding: const EdgeInsets.only(right: 2.0),
                  child: Icon(UniconsLine.search),
                ),
              ),
              hintText: 'Type a city name here',
              hintStyle: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.grey[800]),
            ),
          ),
        ),
      ],
    );
  }
}
