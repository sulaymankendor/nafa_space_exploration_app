import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:spacex_flutter_app/presentation/utils/fotmatDate.dart';

class LaunchCard extends StatelessWidget {
  dynamic launches;
  String? missionName;
  String? launchDate;
  LaunchCard({
    required this.missionName,
    required this.launchDate,
    required this.launches,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/launchDetails', arguments: launches);
      },
      child: Card(
        color: Theme.of(context).cardTheme.color,
        shape: Theme.of(context).cardTheme.shape,
        elevation: Theme.of(context).cardTheme.elevation,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(Icons.rocket_launch, size: 40),
              SizedBox(width: 15), // Replace spacing with this
              Expanded(
                // Add Expanded to prevent overflow
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      missionName ?? 'Unknown Mission', // Add null safety
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 8), // Add some spacing between texts
                    Text(
                      formatLaunchDate(launchDate!), // Add null safety
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 3, // Prevent text overflow
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
