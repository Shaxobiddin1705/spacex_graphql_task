import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlService{
  static final HttpLink httpLink = HttpLink('https://spacex-production.up.railway.app/');

  final GraphQLClient client = GraphQLClient(
    cache: GraphQLCache(),
    link: httpLink,
  );

}