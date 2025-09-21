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
          return const Center(child: CircularProgressIndicator());
        }

        if (rocketProvider.error != null) {
          return Center(
            child: Text(
              'Error: ${rocketProvider.error}',
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          );
        }

        // Add the null check here to handle the no-network scenario.
        if (rocketProvider.rockets == null || rocketProvider.rockets!.isEmpty) {
          return const Center(
            child: Text(
              'No rocket data available. Please check your network connection.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        if (screenWidth(context) < maxMobileScreenWidth) {
          return Container(
            width: containersMediaQuery(context),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
          );
        } else {
          return Center(
            child: Container(
              width: containersMediaQuery(context),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
        }
      },
    );
  }
}
