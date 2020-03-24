import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:px/domain/login/login_repository.dart';
import 'package:px/presentation/screens/login/bloc/login/login_bloc.dart';
import 'package:px/presentation/screens/login/login_button.dart';
import 'package:px/presentation/screens/login/login_form.dart';

import 'bloc/Authentication/authentication_bloc.dart';

class LoginScreen extends StatefulWidget {
  final UserRepository _userRepository;

  LoginScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc _loginBloc;

  UserRepository get _userRepository => widget._userRepository;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc(
      userRepository: _userRepository,
    );
     }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<LoginBloc>(
        create: (BuildContext context) =>LoginBloc(userRepository: _userRepository),
        child: LoginForm(userRepository: _userRepository,),
      ),
    );
  }

}
