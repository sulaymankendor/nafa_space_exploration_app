import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/presentation/widgets/launches_screen/launch_card.dart';

class DisplayLaunches extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        LaunchCard(),
        LaunchCard(),
        LaunchCard(),
        LaunchCard(),
        LaunchCard(),
        LaunchCard(),
        LaunchCard(),
        LaunchCard(),
        LaunchCard(),
        LaunchCard(),
        LaunchCard(),
      ],
    );
  }
}
