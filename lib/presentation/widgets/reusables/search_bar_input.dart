import 'package:flutter/material.dart';

class SearchBarInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SearchBar(
        hintText: 'Search...',
        elevation: WidgetStatePropertyAll(0),

        backgroundColor: WidgetStatePropertyAll(
          Theme.of(context).colorScheme.onSecondary,
        ),
        leading: Icon(Icons.search),
      ),
    );
  }
}
