import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/presentation/widgets/search_screen/search_card.dart';

class DisplaySearchResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),

        child: Column(
          spacing: 15,

          children: [
            SearchCard(),
            SearchCard(),
            SearchCard(),
            SearchCard(),
            SearchCard(),
            SearchCard(),
            SearchCard(),
            SearchCard(),
            SearchCard(),
          ],
        ),
      ),
    );
  }
}
