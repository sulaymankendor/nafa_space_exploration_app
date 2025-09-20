import 'package:flutter/material.dart';

import 'package:spacex_flutter_app/presentation/widgets/home_screen/screen_navs/nav.dart';

class NavSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Nav(
            title: 'Capsules',
            imageName: 'capsule.jpg',
            screen: '/capsuleDetails',
          ),
          Nav(
            title: 'Rockets',
            imageName: 'rockets.jpg',
            screen: '/rocketDetails',
          ),
          Nav(
            title: 'Launches',
            imageName: 'launches.png',
            screen: '/launchDetails',
          ),
        ],
      ),
    );
  }
}
