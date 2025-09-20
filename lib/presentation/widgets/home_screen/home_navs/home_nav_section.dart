import 'package:flutter/material.dart';

class HomeNavSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 35, left: 15),
      child: Row(
        spacing: 20,
        children: [
          Text('All', style: Theme.of(context).textTheme.labelLarge),
          Text('Launchpads', style: Theme.of(context).textTheme.labelLarge),
          Text('Landpads', style: Theme.of(context).textTheme.labelLarge),
        ],
      ),
    );
  }
}
