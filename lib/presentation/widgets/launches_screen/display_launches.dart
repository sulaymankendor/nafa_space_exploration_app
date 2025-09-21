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
    // Fetch launches when the widget loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LaunchProvider>().fetchlaunchesData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LaunchProvider>(
      builder: (context, launchProvider, child) {
        if (launchProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (launchProvider.error != null) {
          return Center(
            child: Text(
              'Error: ${launchProvider.error}',
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          );
        }

        // Add the null check here to prevent crashes
        if (launchProvider.launches == null ||
            launchProvider.launches!.isEmpty) {
          return const Center(
            child: Text(
              'No launch data available. Please check your network connection.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        // The rest of the code is now safe to execute
        if (screenWidth(context) < maxMobileScreenWidth) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            width: containersMediaQuery(context),
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
          );
        } else {
          return Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              width: containersMediaQuery(context),
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
        }
      },
    );
  }
}
