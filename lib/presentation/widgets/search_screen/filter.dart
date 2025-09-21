import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/presentation/utils/responsive_helpers.dart';

class Filter extends StatelessWidget {
  dynamic setCategory;
  String currentCategory;
  Filter({required this.setCategory, required this.currentCategory});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> categories = [
      {"category": 'Capsules', 'toFilter': 'Capsule'},
      {"category": 'Rockets', 'toFilter': 'Rocket'},
      {"category": 'Launches', 'toFilter': 'Launch'},
      {"category": 'Launchpads', 'toFilter': 'Launchpad'},
      {"category": 'Landpads', 'toFilter': 'Landpad'},
    ];

    return Container(
      width: containersMediaQuery(context),
      padding: EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: EdgeInsets.only(top: 45, left: 15),
        child: Container(
          height: 60, // Give the ListView a height constraint
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // Make it scroll horizontally
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: 20), // Add spacing between items
                child: InkWell(
                  onTap: () {
                    setCategory(categories[index]['toFilter']);
                  },
                  borderRadius: BorderRadius.circular(9999),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Text(
                          categories[index]['category'] ?? '',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Positioned(
                          bottom: -8,
                          left: 2,
                          child:
                              currentCategory == categories[index]['toFilter']
                              ? Container(
                                  height: 4,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(999),
                                  ),
                                )
                              : SizedBox.shrink(), // Better than empty Container
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
