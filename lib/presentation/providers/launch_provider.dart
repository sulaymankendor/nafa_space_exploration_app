import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/presentation/utils/fetch_launches.dart';

// TODO: Implement LaunchProvider
// This is a placeholder for the launch state management
// You need to implement:
// 1. Launch data models
// 2. GraphQL queries for launches
// 3. Repository pattern for data fetching
// 4. State management for launches list, loading, error states

class LaunchProvider extends ChangeNotifier {
  // TODO: Add launch-related state variables
  List<Map<String, dynamic>>? _launches = [];
  bool _isLoading = false;
  String? _error;

  // TODO: Add getters
  List<Map<String, dynamic>>? get launches =>
      _launches != null ? _launches : null;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // TODO: Add methods
  Future<void> fetchlaunchesData() async {
    try {
      List<Map<String, dynamic>>? listOfLaunches = await fetchLaunches(
        _isLoading,
        _error,
      );
      _launches = listOfLaunches;
    } catch (e) {
      _isLoading = false;
      _error = 'An unexpected error occurred: $e';
    }

    notifyListeners();
  }

  // Future<void> fetchUpcomingLaunches()
  // Future<void> fetchPastLaunches()
  // Future<void> fetchLaunchById(String id)
  // void clearError()
  // void refreshLaunches()

  @override
  void dispose() {
    // TODO: Clean up resources
    super.dispose();
  }
}
