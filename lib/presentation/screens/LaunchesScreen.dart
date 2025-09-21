import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/presentation/widgets/launches_screen/display_launches.dart';
import 'package:spacex_flutter_app/presentation/widgets/app_bars/custom_app_bar.dart';

class LaunchesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Launches'),
      body: SafeArea(child: DisplayLaunches()),
    );
  }
}
