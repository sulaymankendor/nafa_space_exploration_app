import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/presentation/utils/fetch_landpads.dart';
import 'package:spacex_flutter_app/presentation/utils/fetch_launchpads.dart';

import 'package:spacex_flutter_app/presentation/widgets/home_screen/display_info_cards.dart';
import 'package:spacex_flutter_app/presentation/widgets/home_screen/home_navs/home_nav_section.dart';
import 'package:spacex_flutter_app/presentation/widgets/home_screen/screen_navs/nav_section.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  List<Map<String, dynamic>>? launchpads = [];
  List<Map<String, dynamic>>? landpads = [];
  List<Map<String, dynamic>>? listOfLaunchPadsAndLandpads = [];

  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    try {
      launchpads = await fetchLaunchpads();
      landpads = await fetchLandpads();

      if (launchpads != null && landpads != null) {
        setState(() {
          listOfLaunchPadsAndLandpads = [...launchpads!, ...landpads!];
        });
      }
    } catch (e) {
      print('Error loading data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              NavSection(),

              DisplayInfoCards(
                listOfLaunchPadsAndLandpads: listOfLaunchPadsAndLandpads,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
