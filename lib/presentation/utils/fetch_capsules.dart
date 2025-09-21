import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex_flutter_app/core/network/graphql_client.dart';
import 'package:spacex_flutter_app/data/queries/capsules_query.dart';

// Add this method to your GraphQLService class
Future<List<Map<String, dynamic>>?> fetchCapsules(error) async {
  try {
    final QueryResult result = await GraphQLService.client.query(
      QueryOptions(
        document: gql(capsulesQuery),
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
      error = message;
      return null;
    }

    if (result.data != null && result.data!['capsules'] != null) {
      return List<Map<String, dynamic>>.from(result.data!['capsules']);
    }

    return null;
  } catch (e) {
    error = '';
    return null;
  }
}
