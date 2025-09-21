import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/presentation/utils/fotmatDate.dart';
import 'package:spacex_flutter_app/presentation/utils/responsive_helpers.dart';

class SearchCard extends StatelessWidget {
  Map<String, dynamic> item = {};

  SearchCard({required this.item});

  @override
  Widget build(BuildContext context) {
    print(item);
    String displayText = '';
    String displayBodyText = '';

    switch (item['__typename']) {
      case 'Capsule':
        displayText = item['type'];
        break;
      case 'Rocket':
        displayText = item['name'];
        break;
      case 'Launch':
        displayText = item['mission_name'];
        break;
      case 'Launchpad':
        displayText = item['name'];
        break;
      case 'Landpad':
        displayText = item['full_name'];
        break;
      default:
        displayText = 'Unknown';
    }
    switch (item['__typename']) {
      case 'Capsule':
        displayBodyText = item['type'];
        break;
      case 'Rocket':
        displayBodyText = item['description'];
        break;
      case 'Launch':
        displayBodyText = formatLaunchDate(item['launch_date_local']);
        break;
      case 'Launchpad':
        displayBodyText = item['details'];
        break;
      case 'Landpad':
        displayBodyText = item['details'];
        break;
      default:
        displayBodyText = 'Unknown';
    }

    return GestureDetector(
      onTap: () {
        print('asd');
      },
      child: screenWidth(context) < maxMobileScreenWidth
          ? Container(
              width: containersMediaQuery(context),

              child: Card(
                color: Theme.of(context).cardTheme.color,
                shape: Theme.of(context).cardTheme.shape,
                elevation: Theme.of(context).cardTheme.elevation,

                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    spacing: 15,

                    children: [
                      Icon(Icons.rocket_launch, size: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            displayText,

                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Container(
                            width: 200, //to be changed to relative the screen
                            child: Text(
                              displayBodyText,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Center(
              child: Container(
                width: containersMediaQuery(context),

                child: Card(
                  color: Theme.of(context).cardTheme.color,
                  shape: Theme.of(context).cardTheme.shape,
                  elevation: Theme.of(context).cardTheme.elevation,

                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      spacing: 15,

                      children: [
                        Icon(Icons.rocket_launch, size: 40),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              displayText,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Container(
                              width: textContainerScreenWidth(
                                context,
                              ), //to be changed to relative the screen
                              child: Text(
                                displayBodyText,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
