import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/presentation/utils/responsive_helpers.dart';

class LaunchpadLandpadCard extends StatelessWidget {
  Map<String, dynamic> dataToDisplay;

  LaunchpadLandpadCard({required this.dataToDisplay});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardTheme.color,
      shape: Theme.of(context).cardTheme.shape,
      elevation: Theme.of(context).cardTheme.elevation,

      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          spacing: 15,

          children: [
            dataToDisplay['__typename'] == 'Launchpad'
                ? Icon(Icons.flight_takeoff, size: 40)
                : Icon(Icons.location_on),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dataToDisplay['__typename'] == 'Launchpad'
                      ? dataToDisplay['name']
                      : dataToDisplay['full_name'],
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Container(
                  width: textContainerScreenWidth(
                    context,
                  ), //to be changed to relative the screen
                  child: Text(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    dataToDisplay['__typename'] == 'Launchpad'
                        ? dataToDisplay['details']
                        : dataToDisplay['details'],
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
