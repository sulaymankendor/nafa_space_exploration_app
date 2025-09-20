import 'package:flutter/material.dart';

import 'package:spacex_flutter_app/presentation/widgets/home_screen/display_info_cards.dart';
import 'package:spacex_flutter_app/presentation/widgets/home_screen/home_navs/home_nav_section.dart';
import 'package:spacex_flutter_app/presentation/widgets/home_screen/screen_navs/nav_section.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [NavSection(), HomeNavSection(), DisplayInfoCards()],
          ),
        ),
      ),
    );
  }
}
