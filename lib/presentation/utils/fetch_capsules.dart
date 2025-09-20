import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex_flutter_app/core/network/graphql_client.dart';
import 'package:spacex_flutter_app/data/queries/capsules_query.dart';

// Add this method to your GraphQLService class
Future<List<Map<String, dynamic>>?> fetchCapsules() async {
  try {
    final QueryResult result = await GraphQLService.client.query(
      QueryOptions(
        document: gql(capsulesQuery),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (result.hasException) {
      print('GraphQL Error: ${result.exception}');
      return null;
    }

    if (result.data != null && result.data!['capsules'] != null) {
      return List<Map<String, dynamic>>.from(result.data!['capsules']);
    }

    return null;
  } catch (e) {
    print('Error: $e');
    return null;
  }
}
