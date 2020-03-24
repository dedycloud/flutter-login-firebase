// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:px/common/network/gql_client.dart';
import 'package:px/common/network/network_check.dart';
import 'package:connectivity/connectivity.dart';
import 'package:px/data/employee/datasources/employee_gql_datasource.dart';
import 'package:graphql/src/graphql_client.dart';
import 'package:px/data/employee/datasources/employee_remote_datasource.dart';
import 'package:dio/src/dio.dart';
import 'package:px/data/employee/repository/employee_repository.dart';
import 'package:px/domain/employee/repository/employee_repository.dart';
import 'package:px/domain/employee/usecases/employee_usecases.dart';
import 'package:px/presentation/screens/register/bloc/register_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void $initGetIt({String environment}) {
  getIt
    ..registerFactory<GqlClientBase>(() => GqlClient())
    ..registerLazySingleton<GqlClient>(() => GqlClient())
    ..registerFactory<NetworkCheck>(
        () => NetworkCheckImpl(connectivity: getIt<Connectivity>()))
    ..registerLazySingleton<NetworkCheckImpl>(
        () => NetworkCheckImpl(connectivity: getIt<Connectivity>()))
    ..registerFactory<EmployeeGqlDatasource>(
        () => EmployeeGqlDatasourceImpl(graphqlClient: getIt<GraphQLClient>()))
    ..registerLazySingleton<EmployeeGqlDatasourceImpl>(
        () => EmployeeGqlDatasourceImpl(graphqlClient: getIt<GraphQLClient>()))
    ..registerFactory<EmployeeRemoteDatasource>(
        () => EmployeeRemoteDatasourceImpl(httpClient: getIt<Dio>()))
    ..registerLazySingleton<EmployeeRemoteDatasourceImpl>(
        () => EmployeeRemoteDatasourceImpl(httpClient: getIt<Dio>()))
    ..registerLazySingleton<EmployeeRepositoryImpl>(() =>
        EmployeeRepositoryImpl(
            employeeGqlDatasource: getIt<EmployeeGqlDatasource>(),
            networkCheck: getIt<NetworkCheck>()))
    ..registerFactory<EmployeeRepository>(() => EmployeeRepositoryImpl(
        employeeGqlDatasource: getIt<EmployeeGqlDatasource>(),
        networkCheck: getIt<NetworkCheck>()))
    ..registerLazySingleton<GetEmployeeUsecase>(() =>
        GetEmployeeUsecase(employeeRepository: getIt<EmployeeRepository>()))
    ..registerFactory<RegisterBloc>(
        () => RegisterBloc(getEmployeeUsecase: getIt<GetEmployeeUsecase>()));
}
