import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:equatable/equatable.dart';
import 'package:px/data/employee/models/employee_model.dart';
import 'package:px/domain/employee/usecases/employee_usecases.dart';

part 'register_event.dart';
part 'register_state.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final GetEmployeeUsecase getEmployeeUsecase;

  RegisterBloc({@required this.getEmployeeUsecase});

  @override
  RegisterState get initialState => RegisterInitial();

  @override
  Stream<RegisterState> transformEvents(
    Stream<RegisterEvent> events,
    Stream<RegisterState> Function(RegisterEvent event) next,
  ) {
    return super.transformEvents(
      events.debounceTime(
        Duration(milliseconds: 1500),
      ),
      next,
    );
  }

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is GetEmployee) {
      yield EmployeeLoading();

      try {
        Map payload = {'email': event.email};
        final employee = await getEmployeeUsecase.call(payload);
        yield EmployeeLoaded(employee: employee);
      } catch (_) {
        yield EmployeeError();
      }
    }
  }
}
