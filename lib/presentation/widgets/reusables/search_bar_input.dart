import 'package:flutter/material.dart';

class SearchBarInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SearchBar(
        hintText: 'Search...',
        elevation: WidgetStatePropertyAll(0),

        backgroundColor: WidgetStatePropertyAll(
          const Color.fromARGB(255, 46, 53, 66),
        ),
        leading: Icon(Icons.search),
      ),
    );
  }
}
