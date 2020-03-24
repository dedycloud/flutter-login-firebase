part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class GetEmployee extends RegisterEvent {
  final String email;

  GetEmployee({@required this.email}) : assert(email != null);

  @override
  List<Object> get props => [email];
}
