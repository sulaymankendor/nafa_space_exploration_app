import 'package:flutter/material.dart';

import 'package:spacex_flutter_app/presentation/widgets/home_screen/info_cards/landpad_card.dart';
import 'package:spacex_flutter_app/presentation/widgets/home_screen/info_cards/launchpad_card.dart';

class DisplayInfoCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(top: 30),
      child: Column(spacing: 15, children: [LaunchPadCard(), LandPadCard()]),
    );
  }
}
