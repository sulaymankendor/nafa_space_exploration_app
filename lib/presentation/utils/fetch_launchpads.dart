import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex_flutter_app/core/network/graphql_client.dart';
import 'package:spacex_flutter_app/data/queries/launchpads_query.dart';

// Add this method to your GraphQLService class
Future<List<Map<String, dynamic>>?> fetchLaunchpads() async {
  try {
    final QueryResult result = await GraphQLService.client.query(
      QueryOptions(
        document: gql(launchpadsQuery),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (result.hasException) {
      print('GraphQL Error: ${result.exception}');
      return null;
    }

    if (result.data != null && result.data!['launchpads'] != null) {
      final List<dynamic> launchpadsJson =
          result.data!['launchpads'] as List<dynamic>;
      final List<Map<String, dynamic>> launchpads = launchpadsJson
          .map((json) => json as Map<String, dynamic>)
          .toList();
      return launchpads;
    }

    return null;
  } catch (e) {
    print('Error: $e');
    return null;
  }
}
