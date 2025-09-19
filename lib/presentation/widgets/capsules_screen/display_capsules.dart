import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/presentation/widgets/capsules_screen/capsule_card.dart';
import 'package:spacex_flutter_app/presentation/widgets/rockets_screen/rocket_card.dart';

class DisplayCapsules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        CapsuleCard(),
        CapsuleCard(),
        CapsuleCard(),
        CapsuleCard(),
        CapsuleCard(),
        CapsuleCard(),
        CapsuleCard(),
        CapsuleCard(),
        CapsuleCard(),
      ],
    );
  }
}
