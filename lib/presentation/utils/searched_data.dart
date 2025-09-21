List<Map<String, dynamic>>? searchedData(
  List<Map<String, dynamic>>? data,
  String searchText,
) {
  List<Map<String, dynamic>>? _searchedItems = [];
  if (data != null && data != []) {
    for (var index = 0; index < data!.length; index++) {
      if (data[index]['__typename'] == 'Capsule') {
        if (data[index]['type'].toLowerCase().contains(
          searchText.toLowerCase(),
        )) {
          _searchedItems.add(data[index]);
        }
      } else if (data[index]['__typename'] == 'Rocket') {
        if (data[index]['name'].toLowerCase().contains(
          searchText.toLowerCase(),
        )) {
          _searchedItems.add(data[index]);
        }
      } else if (data[index]['__typename'] == 'Launch') {
        if (data[index]['mission_name'].toLowerCase().contains(
          searchText.toLowerCase(),
        )) {
          _searchedItems.add(data[index]);
        }
      } else if (data[index]['__typename'] == 'Launchpad') {
        if (data[index]['name'].toLowerCase().contains(
          searchText.toLowerCase(),
        )) {
          _searchedItems.add(data[index]);
        }
      } else if (data[index]['__typename'] == 'Landpad') {
        if (data[index]['full_name'].toLowerCase().contains(
          searchText.toLowerCase(),
        )) {
          _searchedItems.add(data[index]);
        }
      }
    }
  }

  return _searchedItems;
}
