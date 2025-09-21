import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/presentation/utils/responsive_helpers.dart';

class FavouriteCard extends StatelessWidget {
  String? name;
  String? description;
  FavouriteCard({required this.name, required this.description});
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
            Icon(Icons.rocket_launch, size: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name!, style: Theme.of(context).textTheme.bodyLarge),
                Container(
                  width: textContainerScreenWidth(context),
                  child: Text(
                    description!,
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
