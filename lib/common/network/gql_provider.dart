import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GqlProvider extends StatelessWidget {
  final Widget child;
  final GraphQLClient client;

  GqlProvider({@required this.child, @required this.client});

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ValueNotifier(client),
      child: child,
    );
  }
}
