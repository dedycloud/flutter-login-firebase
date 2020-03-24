import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:px/common/network/gql_client.dart';
import 'package:px/common/network/gql_provider.dart';
import 'package:px/common/routes/routes.dart';
import 'package:px/common/routes/routing.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final GraphQLClient _client = new GqlClient().setup();
  @override
  Widget build(BuildContext context) {
    return GqlProvider(
      client: _client,
      child: MaterialApp(
        title: 'PX',
        initialRoute: Routes.splashScreen,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
