import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:px/domain/login/login_repository.dart';
import 'package:px/presentation/screens/home/home_screen.dart';
import 'package:px/presentation/screens/login/bloc/Authentication/authentication_bloc.dart';
import 'package:px/presentation/screens/login/login_screen.dart';
class Auth extends StatefulWidget {

  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final UserRepository _userRepository = UserRepository();
  AuthenticationBloc _authenticationBloc;


  @override
  void initState() {
    super.initState();
    _authenticationBloc = AuthenticationBloc(userRepository: _userRepository);
    _authenticationBloc.add(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
      return BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) => AuthenticationBloc(userRepository: _userRepository),
        child: Scaffold(
           body:  BlocBuilder(
            bloc: _authenticationBloc,
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
            },
          ),
        ),
      );
  }


}