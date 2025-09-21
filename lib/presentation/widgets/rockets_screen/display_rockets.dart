import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/presentation/providers/rocket_provider.dart';
import 'package:spacex_flutter_app/presentation/utils/responsive_helpers.dart';
import 'package:spacex_flutter_app/presentation/widgets/rockets_screen/rocket_card.dart';
import 'package:provider/provider.dart';

class DisplayRockets extends StatefulWidget {
  @override
  State<DisplayRockets> createState() => _DisplayRockets();
}

class _DisplayRockets extends State<DisplayRockets> {
  @override
  void initState() {
    super.initState();
    // Fetch rockets when the widget loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RocketProvider>().fetchRocketsData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RocketProvider>(
      builder: (context, rocketProvider, child) {
        if (rocketProvider.isLoading) {
          return Container(
            height: 300, // Give it explicit height
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (rocketProvider.error != null) {
          return Container(
            height: 200,
            child: Center(
              child: Text(
                'Error: ${rocketProvider.error}',
                style: TextStyle(color: Colors.red),
              ),
            ),
          );
        }

        if (screenWidth(context) < maxMobileScreenWidth) {
          return Container(
            width: containersMediaQuery(context),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Expanded(
              child: ListView.builder(
                itemCount: rocketProvider.rockets!.length,
                itemBuilder: (context, index) {
                  final rocket = rocketProvider.rockets![index];
                  return RocketCard(
                    rocket: rocket,
                    name: rocket['name'],
                    description: rocket['description'],
                  );
                },
              ),
            ),
          );
        } else {
          return Center(
            child: Container(
              width: containersMediaQuery(context),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Expanded(
                child: ListView.builder(
                  itemCount: rocketProvider.rockets!.length,
                  itemBuilder: (context, index) {
                    final rocket = rocketProvider.rockets![index];
                    return RocketCard(
                      rocket: rocket,
                      name: rocket['name'],
                      description: rocket['description'],
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
