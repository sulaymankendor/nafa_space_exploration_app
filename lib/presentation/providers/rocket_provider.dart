import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/presentation/utils/fetch_rockets.dart';

// TODO: Implement RocketProvider
// This is a placeholder for the rocket state management
// You need to implement:
// 1. Rocket data models
// 2. GraphQL queries for rockets
// 3. Repository pattern for data fetching
// 4. State management for rockets list, loading, error states

class RocketProvider extends ChangeNotifier {
  // TODO: Add rocket-related state variables
  List<Map<String, dynamic>>? _rockets = [];
  bool _isLoading = false;
  String? _error;

  // TODO: Add getters
  List<Map<String, dynamic>>? get rockets => _rockets != null ? _rockets : null;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // TODO: Add methods
  Future<void> fetchRocketsData() async {
    try {
      List<Map<String, dynamic>>? listOfRockets = await fetchRockets(
        _isLoading,
        _error,
      );
      _rockets = listOfRockets;
    } catch (e) {
      _isLoading = false;
      _error = 'An unexpected error occurred: $e';
    }

    notifyListeners();
  }
  // Future<void> fetchRocketById(String id)
  // void clearError()
  // void refreshRockets()

  @override
  void dispose() {
    // TODO: Clean up resources
    super.dispose();
  }
}
