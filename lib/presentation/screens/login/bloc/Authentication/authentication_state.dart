part of 'authentication_bloc.dart';



@immutable
abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}
class Uninitialized extends AuthenticationState {}


class Authenticated extends AuthenticationState {
  final String displayName;

  Authenticated(this.displayName);

  @override
  String toString() => 'Authenticated';

  @override
  // TODO: implement props
  List<Object> get props =>  [displayName];
}

class Unauthenticated extends AuthenticationState {
  @override
  String toString() => 'Unauthenticated';

  @override
  // TODO: implement props
  List<Object> get props => null;
}