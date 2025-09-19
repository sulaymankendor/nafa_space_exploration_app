import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/presentation/widgets/app_bars/custom_app_bar.dart';
import 'package:spacex_flutter_app/presentation/widgets/reusables/search_bar_input.dart';
import 'package:spacex_flutter_app/presentation/widgets/search_screen/display_search_results.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Search'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(children: [SearchBarInput(), DisplaySearchResults()]),
        ),
      ),
    );
  }
}
