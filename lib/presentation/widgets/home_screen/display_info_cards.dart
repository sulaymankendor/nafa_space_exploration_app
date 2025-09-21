import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/presentation/utils/responsive_helpers.dart';

import 'package:spacex_flutter_app/presentation/widgets/home_screen/info_cards/launchpad_landpad_card.dart';
import 'package:spacex_flutter_app/presentation/widgets/home_screen/info_cards/launchpad_card.dart';

class DisplayInfoCards extends StatelessWidget {
  dynamic listOfLaunchPadsAndLandpads;
  DisplayInfoCards({required this.listOfLaunchPadsAndLandpads});
  @override
  Widget build(BuildContext context) {
    if (screenWidth(context) <= maxMobileScreenWidth) {
      return Container(
        width: containersMediaQuery(context),
        child: Padding(
          padding: EdgeInsetsGeometry.only(top: 30),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: listOfLaunchPadsAndLandpads?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: LaunchpadLandpadCard(
                      dataToDisplay: listOfLaunchPadsAndLandpads[index],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    } else {
      return Center(
        child: Container(
          width: containersMediaQuery(context),
          child: Padding(
            padding: EdgeInsetsGeometry.only(top: 30),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: listOfLaunchPadsAndLandpads?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: LaunchpadLandpadCard(
                        dataToDisplay: listOfLaunchPadsAndLandpads[index],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
