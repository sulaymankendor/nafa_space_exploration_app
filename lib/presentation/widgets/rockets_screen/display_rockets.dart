import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/presentation/widgets/rockets_screen/rocket_card.dart';

class DisplayRockets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        RocketCard(),
        RocketCard(),
        RocketCard(),
        RocketCard(),
        RocketCard(),
        RocketCard(),
        RocketCard(),
        RocketCard(),
        RocketCard(),
        RocketCard(),
      ],
    );
  }
}
