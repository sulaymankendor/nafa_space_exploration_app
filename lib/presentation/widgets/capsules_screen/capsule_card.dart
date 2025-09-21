import 'package:flutter/material.dart';

class CapsuleCard extends StatelessWidget {
  String? type;
  String? status;
  CapsuleCard({required this.type, required this.status});
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
                Text(type!, style: Theme.of(context).textTheme.bodyLarge),
                Container(
                  width: 200,
                  child: Text(
                    status!,
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
