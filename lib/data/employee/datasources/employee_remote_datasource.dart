import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

import 'package:px/env.dart';

import 'package:px/data/employee/models/employee_model.dart';

@Bind.toType(EmployeeRemoteDatasourceImpl)
@injectable
abstract class EmployeeRemoteDatasource {
  Future<Employee> getEmployee({@required String email});
}

@lazySingleton
@injectable
class EmployeeRemoteDatasourceImpl implements EmployeeRemoteDatasource {
  final Dio httpClient;
  final String _baseUrl = environment['baseUrl'];

  EmployeeRemoteDatasourceImpl({@required this.httpClient});

  @override
  Future<Employee> getEmployee({@required String email}) async {
    final Response response =
        await httpClient.get('${_baseUrl}employee/$email');

    return Employee.fromJson(response.data);
  }
}
