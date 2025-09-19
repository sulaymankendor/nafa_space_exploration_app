import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/presentation/widgets/rockets_screen/display_rockets.dart';
import 'package:spacex_flutter_app/presentation/widgets/app_bars/custom_app_bar.dart';

class RocketsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Rockets'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: DisplayRockets(),
        ),
      ),
    );
  }
}
