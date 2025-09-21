import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/presentation/widgets/search_screen/search_card.dart';

class DisplaySearchResults extends StatelessWidget {
  List<Map<String, dynamic>>? searchedItems = [];
  DisplaySearchResults({required this.searchedItems});

  @override
  Widget build(BuildContext context) {
    print(searchedItems![0]);
    if (searchedItems?.length == 0) {
      return Container();
    } else {
      return Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: searchedItems?.length,
              itemBuilder: (context, index) {
                return ListTile(title: SearchCard(item: searchedItems![index]));
              },
            ),
          ),
        ],
      );
    }
  }
}
