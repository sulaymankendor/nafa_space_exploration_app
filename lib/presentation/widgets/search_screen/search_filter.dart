import 'package:flutter/material.dart';

class SearchFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        print('filter');
      },
      icon: Icon(Icons.filter_alt),
    );
  }
}
