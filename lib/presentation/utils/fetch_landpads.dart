import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex_flutter_app/core/network/graphql_client.dart';
import 'package:spacex_flutter_app/data/queries/landpads_query.dart';

// Add this method to your GraphQLService class
Future<List<Map<String, dynamic>>?> fetchLandpads() async {
  try {
    final QueryResult result = await GraphQLService.client.query(
      QueryOptions(
        document: gql(landpadsQuery),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (result.hasException) {
      print('GraphQL Error: ${result.exception}');
      return null;
    }

    if (result.data != null && result.data!['landpads'] != null) {
      final List<dynamic> landpadsJson =
          result.data!['landpads'] as List<dynamic>;
      final List<Map<String, dynamic>> landpads = landpadsJson
          .map((json) => json as Map<String, dynamic>)
          .toList();
      return landpads;
    }

    return null;
  } catch (e) {
    print('Error: $e');
    return null;
  }
}
