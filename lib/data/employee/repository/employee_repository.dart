import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';

import 'package:px/common/network/network_check.dart';
import 'package:px/common/errors/no_connection_errors.dart';
import 'package:px/data/employee/datasources/employee_gql_datasource.dart';

// import 'package:px/data/employee/datasources/employee_remote_datasource.dart';
import 'package:px/domain/employee/entities/employee_entity.dart';
import 'package:px/domain/employee/repository/employee_repository.dart';

@lazySingleton
@injectable
class EmployeeRepositoryImpl implements EmployeeRepository {
  // final EmployeeRemoteDatasource employeeRemoteDatasource;
  final EmployeeGqlDatasource employeeGqlDatasource;
  final NetworkCheck networkCheck;

  EmployeeRepositoryImpl({
    @required this.employeeGqlDatasource,
    @required this.networkCheck,
  });

  @override
  Future<EmployeeEntity> getEmployeeByEmail({@required String email}) async {
    if (await networkCheck.isOnline()) {
      final employee = await employeeGqlDatasource.getEmployee(email: email);
      print('ini employee $employee');
      return employee;
    } else {
      throw NoConnectionError();
    }
  }
}
