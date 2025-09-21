import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/presentation/utils/responsive_helpers.dart';

class SearchBarInput extends StatefulWidget {
  final Function(String) onSearchChanged; // Callback function

  const SearchBarInput({Key? key, required this.onSearchChanged})
    : super(key: key);

  @override
  State<SearchBarInput> createState() => _SearchBarInputState();
}

class _SearchBarInputState extends State<SearchBarInput> {
  final SearchController _searchController = SearchController();
  String searchText = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _handleSearchChange(String value) {
    setState(() {
      searchText = value;
    });
    widget.onSearchChanged(value); // Call parent's callback
  }

  Widget _buildSearchBar() {
    return SearchBar(
      controller: _searchController,
      onChanged: _handleSearchChange,
      hintText: 'Search...',
      elevation: WidgetStatePropertyAll(0),
      backgroundColor: WidgetStatePropertyAll(
        Theme.of(context).colorScheme.onSecondary,
      ),
      leading: Icon(Icons.search),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = screenWidth(context) < maxMobileScreenWidth;

    if (isMobile) {
      return Container(
        width: searchBarWidthMediaQuery(context),
        child: _buildSearchBar(),
      );
    }

    // Desktop/Tablet layout
    return Container(
      width: containersMediaQuery(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: searchBarWidthMediaQuery(context),
            child: _buildSearchBar(),
          ),
        ],
      ),
    );
  }
}
