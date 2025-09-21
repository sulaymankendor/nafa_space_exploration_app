import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex_flutter_app/presentation/providers/capsule_provider.dart';
import 'package:spacex_flutter_app/presentation/providers/launch_provider.dart';
import 'package:spacex_flutter_app/presentation/providers/rocket_provider.dart';
import 'package:spacex_flutter_app/presentation/utils/fetch_landpads.dart';
import 'package:spacex_flutter_app/presentation/utils/fetch_launchpads.dart';
import 'package:spacex_flutter_app/presentation/utils/searched_data.dart';
import 'package:spacex_flutter_app/presentation/widgets/app_bars/custom_app_bar.dart';
import 'package:spacex_flutter_app/presentation/widgets/reusables/search_bar_input.dart';
import 'package:spacex_flutter_app/presentation/widgets/search_screen/display_search_results.dart';
import 'package:spacex_flutter_app/presentation/widgets/search_screen/filter.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchText = '';
  List<Map<String, dynamic>>? launchpads;
  List<Map<String, dynamic>>? landpads;
  String currentCategory = 'Capsule';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CapsuleProvider>().fetchCapsulesData();
      context.read<RocketProvider>().fetchRocketsData();
      context.read<LaunchProvider>().fetchlaunchesData();
    });
    _fetchListLaunchpads();
    _fetchListLandpads();
  }

  void setCurrentCategory(String category) {
    setState(() {
      searchText = '';
      currentCategory = category;
    });
  }

  Future<void> _fetchListLaunchpads() async {
    final data = await fetchLaunchpads();
    setState(() {
      launchpads = data;
    });
  }

  Future<void> _fetchListLandpads() async {
    final data = await fetchLandpads();
    setState(() {
      landpads = data;
    });
  }

  void _handleSearchChanged(String text) {
    setState(() {
      searchText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final capsules = context.watch<CapsuleProvider>();
    final rockets = context.watch<RocketProvider>();
    final launches = context.watch<LaunchProvider>();

    // Determine which list to display based on the current category
    List<Map<String, dynamic>>? baseList;
    if (currentCategory == 'Capsule') {
      baseList = capsules.capsule;
    } else if (currentCategory == 'Rocket') {
      baseList = rockets.rockets;
    } else if (currentCategory == 'Launch') {
      baseList = launches.launches;
    } else if (currentCategory == 'Launchpad') {
      baseList = launchpads;
    } else if (currentCategory == 'Landpad') {
      baseList = landpads;
    }

    // Apply the search filter if searchText is not empty
    List<Map<String, dynamic>>? displayItems;
    if (baseList != null && searchText.isNotEmpty) {
      displayItems = searchedData(baseList, searchText);
    } else {
      displayItems = baseList;
    }

    return Scaffold(
      appBar: const CustomAppBar(title: 'Search'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              SearchBarInput(onSearchChanged: _handleSearchChanged),
              Container(
                child: Filter(
                  setCategory: setCurrentCategory,
                  currentCategory: currentCategory,
                ),
              ),
              Expanded(
                child: (displayItems != null && displayItems.isNotEmpty)
                    ? DisplaySearchResults(searchedItems: displayItems)
                    : const Center(child: Text('No results found')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
