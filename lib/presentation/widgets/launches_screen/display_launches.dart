import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/presentation/providers/launch_provider.dart';
import 'package:spacex_flutter_app/presentation/utils/responsive_helpers.dart';
import 'package:spacex_flutter_app/presentation/widgets/launches_screen/launch_card.dart';
import 'package:provider/provider.dart';

class DisplayLaunches extends StatefulWidget {
  @override
  State<DisplayLaunches> createState() => _DisplayLaunchesState();
}

class _DisplayLaunchesState extends State<DisplayLaunches> {
  @override
  void initState() {
    super.initState();
    // Fetch launchess when the widget loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LaunchProvider>().fetchlaunchesData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LaunchProvider>(
      builder: (context, launchProvider, child) {
        if (launchProvider.isLoading) {
          return Container(
            height: 200, // Give it explicit height
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (launchProvider.error != null) {
          return Container(
            height: 200,
            child: Center(
              child: Text(
                'Error: ${launchProvider.error}',
                style: TextStyle(color: Colors.red),
              ),
            ),
          );
        }

        if (launchProvider.launches == null ||
            launchProvider.launches!.isEmpty) {
          return Container(
            height: 200,
            child: Center(child: Text('No launches found')),
          );
        }
        if (screenWidth(context) < maxMobileScreenWidth) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            width: containersMediaQuery(context),
            child: Expanded(
              child: ListView.builder(
                itemCount: launchProvider.launches!.length,
                itemBuilder: (context, index) {
                  final launch = launchProvider.launches![index];
                  return LaunchCard(
                    launches: launch,
                    missionName: launch['mission_name'],
                    launchDate: launch['launch_date_local'],
                  );
                },
              ),
            ),
          );
        } else {
          return Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              width: containersMediaQuery(context),
              child: Expanded(
                child: ListView.builder(
                  itemCount: launchProvider.launches!.length,
                  itemBuilder: (context, index) {
                    final launch = launchProvider.launches![index];
                    return LaunchCard(
                      launches: launch,
                      missionName: launch['mission_name'],
                      launchDate: launch['launch_date_local'],
                    );
                  },
                ),
              ),
            ),
          );
        }
      },
    );
  }
}



// spacing: 15,