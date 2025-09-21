import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/presentation/utils/responsive_helpers.dart';

class SearchBarInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (screenWidth(context) < maxMobileScreenWidth) {
      return Container(
        width: searchBarWidthMediaQuery(context),
        child: SearchBar(
          hintText: 'Search...',
          elevation: WidgetStatePropertyAll(0),

          backgroundColor: WidgetStatePropertyAll(
            Theme.of(context).colorScheme.onSecondary,
          ),
          leading: Icon(Icons.search),
        ),
      );
    } else {
      return Container(
        width: containersMediaQuery(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: searchBarWidthMediaQuery(context),
              child: SearchBar(
                hintText: 'Search...',
                elevation: WidgetStatePropertyAll(0),

                backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.onSecondary,
                ),
                leading: Icon(Icons.search),
              ),
            ),
          ],
        ),
      );
    }
  }
}
