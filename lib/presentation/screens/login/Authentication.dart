import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:px/domain/login/login_repository.dart';
import 'package:px/presentation/screens/home/home_screen.dart';
import 'package:px/presentation/screens/login/bloc/Authentication/authentication_bloc.dart';
import 'package:px/presentation/screens/login/login_screen.dart';
class Authentication extends StatefulWidget {
  final UserRepository _userRepository;

  Authentication({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  UserRepository get _userRepository => widget._userRepository;

  @override
  Widget build(BuildContext context) {
      return BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (BuildContext context, AuthenticationState state) {
              if (state is Uninitialized) {
                return Center(child: Container(child: Text('loading'),),);
              }
              if (state is Unauthenticated) {
                return LoginScreen(userRepository: _userRepository);
              }
              if (state is Authenticated) {
                return HomeScreen(name: state.displayName);
              }
              return null;
            },
          );
  }


}