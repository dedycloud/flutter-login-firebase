import 'package:injectable/injectable.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:px/env.dart';

@Bind.toType(GqlClient)
@injectable
abstract class GqlClientBase {
  GraphQLClient setup();
}

@lazySingleton
@injectable
class GqlClient extends GqlClientBase {
  @override
  GraphQLClient setup() {
    final baseUrl = environment['graphqlBaseUrl'];

    final HttpLink httpLink = HttpLink(uri: '$baseUrl');
    final AuthLink authLink = AuthLink(getToken: () => 'Bearer xxxxx');
    // final ErrorLink errorLink = ErrorLink(
    //   errorHandler: (ErrorResponse response) {
    //     OperationException exception = response.exception;
    //     print(exception.toString());
    //   },
    // );
    final Link link = authLink.concat(httpLink);

    return GraphQLClient(
      cache: InMemoryCache(),
      link: link,
    );
  }
}
