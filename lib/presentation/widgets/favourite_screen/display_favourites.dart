import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/presentation/providers/rocket_provider.dart';
import 'package:spacex_flutter_app/presentation/utils/responsive_helpers.dart';
import 'package:spacex_flutter_app/presentation/widgets/favourite_screen/favourite_card.dart';
import 'package:spacex_flutter_app/presentation/widgets/rockets_screen/rocket_card.dart';
import 'package:provider/provider.dart';

class DisplayFavourites extends StatefulWidget {
  @override
  State<DisplayFavourites> createState() => _DisplayFavourites();
}

class _DisplayFavourites extends State<DisplayFavourites> {
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
            height: 200, // Give it explicit height
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

        if (rocketProvider.rockets == null || rocketProvider.rockets!.isEmpty) {
          return Container(
            height: 200,
            child: Center(child: Text('No rockets found')),
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
                  return FavouriteCard(
                    name: "Lorem Ipsum is simply dummy",
                    description:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was",
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
                    return FavouriteCard(
                      name: 'favourite',
                      description:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was",
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
