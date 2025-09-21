import 'package:flutter/material.dart';
import 'package:spacex_flutter_app/presentation/utils/fetch_capsules.dart';
import 'package:spacex_flutter_app/presentation/utils/fetch_rockets.dart';

// TODO: Implement CapsuleProvider
// This is a placeholder for the capsule state management
// You need to implement:
// 1. capsule data models
// 2. GraphQL queries for capsules
// 3. Repository pattern for data fetching
// 4. State management for capsules list, loading, error states

class CapsuleProvider extends ChangeNotifier {
  // TODO: Add capsule-related state variables
  List<Map<String, dynamic>>? _capsule = [];
  bool _isLoading = false;
  String? _error;

  // TODO: Add getters
  List<Map<String, dynamic>>? get capsule => _capsule != null ? _capsule : null;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // TODO: Add methods
  Future<void> fetchCapsulesData() async {
    try {
      List<Map<String, dynamic>>? listOfRockets = await fetchCapsules(
        _isLoading,
        _error,
      );
      _capsule = listOfRockets;
    } catch (e) {
      _isLoading = false;
      _error = 'An unexpected error occurred: $e';
    }

    notifyListeners();
  }
  // Future<void> fetchcapsuleById(String id)
  // void clearError()
  // void refreshcapsules()

  @override
  void dispose() {
    // TODO: Clean up resources
    super.dispose();
  }
}
