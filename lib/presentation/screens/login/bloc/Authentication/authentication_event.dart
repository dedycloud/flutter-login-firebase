part of 'authentication_bloc.dart';


abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}
// event to notify the bloc that it needs to check if the user is currently authenticated or not.
class AppStarted extends AuthenticationEvent {}
// event to notify the bloc that the user has successfully logged in.
class LoggedIn extends AuthenticationEvent {
  final String token;
  LoggedIn({@required this.token});
  @override
  List<Object> get props => [token];

  @override
  String toString() => 'LoggedIn { token: $token }';
}
// event to notify the bloc that the user has successfully logged out.
class LoggedOut extends AuthenticationEvent {}