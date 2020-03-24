import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';

import 'package:px/common/utils/log.dart';
import 'package:px/data/employee/models/employee_model.dart';
import 'package:px/presentation/screens/register/graphql_operations/queries/px_employee.dart'
    as queries;

@Bind.toType(EmployeeGqlDatasourceImpl)
@injectable
abstract class EmployeeGqlDatasource {
  Future<Employee> getEmployee({@required String email});
}

@lazySingleton
@injectable
class EmployeeGqlDatasourceImpl implements EmployeeGqlDatasource {
  final GraphQLClient graphqlClient;

  EmployeeGqlDatasourceImpl({@required this.graphqlClient});

  @override
  Future<Employee> getEmployee({String email}) async {
    final WatchQueryOptions options = WatchQueryOptions(
      documentNode: gql(queries.pxEmployeeByEmail),
      variables: <String, dynamic>{
        'email': email,
      },
      fetchResults: true,
    );

    final QueryResult queryResults = await graphqlClient.query(options);
    // Log.i('> GQL ${queryResults.data}');
    final List jsonResults = queryResults.data['result']['employee'] as List;
    Log.i(jsonResults[0]);

    return Employee.fromJson(jsonResults.first);
  }
}
