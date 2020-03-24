part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

// Employee in RegisterState
class EmployeeLoading extends RegisterState {}

class EmployeeLoaded extends RegisterState {
  final Employee employee;

  const EmployeeLoaded({
    @required this.employee,
  });

  EmployeeLoaded copyWith({
    Employee employee,
  }) {
    return EmployeeLoaded(
      employee: employee ?? this.employee,
    );
  }

  @override
  List<Object> get props => [employee];

  @override
  String toString() => 'EmployeeLoaded { employee: $employee }';
}

class EmployeeError extends RegisterState {}
