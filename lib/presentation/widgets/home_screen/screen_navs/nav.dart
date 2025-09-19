import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacex_flutter_app/presentation/screens/LaunchesScreen.dart';
import 'package:spacex_flutter_app/presentation/screens/RocketsScreen.dart';
import 'package:spacex_flutter_app/presentation/widgets/launches_screen/launch_card.dart';

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(9999),
          onTap: () {
            Get.toNamed('/launchDetails');
          },
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white54),
              borderRadius: BorderRadius.circular(9999),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(9999),
              child: Image.asset(
                'assets/images/capsule.jpg',
                width: 65,
                height: 65,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
          'Capsules',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
