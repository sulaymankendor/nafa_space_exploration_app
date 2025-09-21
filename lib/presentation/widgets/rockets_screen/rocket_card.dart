import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:spacex_flutter_app/presentation/utils/responsive_helpers.dart';

class RocketCard extends StatelessWidget {
  dynamic rocket;
  String? name;
  String? description;
  RocketCard({
    required this.name,
    required this.description,
    required this.rocket,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/rocketDetails', arguments: rocket);
      },
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
                  Text(name!, style: Theme.of(context).textTheme.bodyLarge),
                  Container(
                    width: textContainerScreenWidth(
                      context,
                    ), //to be changed to relative the screen
                    child: Text(
                      description!,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
