import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/presentation/utils/responsive_helpers.dart';

class SearchCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                            'Earth',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Container(
                            width: 200, //to be changed to relative the screen
                            child: Text(
                              'Jakdjf ajds lfal dslf jalkds flads lkflak dsfjowej a defd',
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
                              'Earth',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Container(
                              width: 200, //to be changed to relative the screen
                              child: Text(
                                'Jakdjf ajds lfal dslf jalkds flads lkflak dsfjowej a defd',
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
