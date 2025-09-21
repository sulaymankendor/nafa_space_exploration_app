import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex_flutter_app/core/network/graphql_client.dart';
import 'package:spacex_flutter_app/data/queries/rockets_query.dart';

// Add this method to your GraphQLService class
Future<List<Map<String, dynamic>>?> fetchRockets(isLoading, error) async {
  isLoading = true;
  try {
    final QueryResult result = await GraphQLService.client.query(
      QueryOptions(
        document: gql(rocketsQuery),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (result.hasException) {
      String message = 'An unknown error occurred.';
      final opException = result.exception?.linkException;

      if (opException is ServerException) {
        message =
            'Server Error: We are having trouble connecting. Please try again later.';
      } else if (opException is NetworkException) {
        message = 'Network Error: Please check your internet connection.';
      } else {
        message = 'Something went wrong. Please try again.';
      }
      isLoading = false;
      error = message;
      return null;
    }

    if (result.data != null && result.data!['rockets'] != null) {
      return List<Map<String, dynamic>>.from(result.data!['rockets']);
    }

    return null;
  } catch (e) {
    isLoading = false;
    error = '';
    print('Error: $e');
    return null;
  }
}
