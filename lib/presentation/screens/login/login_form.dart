import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:px/domain/login/login_repository.dart';
import 'package:px/presentation/screens/login/bloc/login/login_bloc.dart';
import 'package:px/presentation/screens/login/login_button.dart';

import 'bloc/Authentication/authentication_bloc.dart';


class LoginForm extends StatefulWidget {
  final UserRepository _userRepository;

  LoginForm({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);
  State<LoginForm> createState() => _LoginFormState();

}

class _LoginFormState extends State<LoginForm> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginBloc _loginBloc;
  bool _isHidePassword = true;
  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }
  UserRepository get _userRepository => widget._userRepository;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _loginBloc.add(
      EmailChanged(email: _emailController.text),
    );
  }

  void _onPasswordChanged() {
    _loginBloc.add(
      PasswordChanged(password: _passwordController.text),
    );
  }

  void _onFormSubmitted() {
    _loginBloc.add(
      LoginWithCredentialsPressed(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _loginBloc,
      listener: (BuildContext context,LoginState state){
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Login Failure'), Icon(Icons.error)],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Logging In...'),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        }
      },
      child: BlocBuilder(
        bloc: _loginBloc,
        builder: (BuildContext context , LoginState state){
          return Container(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Form(
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Center(
                          child: Text('WELCOME',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  fontFamily: 'Poppins-Bold')),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 50),
                          child: Image.asset(
                            'assets/images/image_login.png',
                            width: 235,
                            height: 249,
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.purple,
                                ),
                              ),
                              labelText: 'Username',
                            ),
                            controller: _emailController,
                            autovalidate: true,
                            autocorrect: false,
                            validator: (_) {
                              return !state.isEmailValid ? 'Invalid Email' : null;
                            },
                          ),
                          width: 315,
                          height: 35,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          width: 315,
                          height: 35,
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: _isHidePassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.purple,
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  _togglePasswordVisibility();
                                },
                                child: Icon(
                                  _isHidePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: _isHidePassword ? Colors.grey : Colors.grey,
                                ),
                              ),
                              labelText: 'Password',
                            ),
                            controller: _passwordController,
                            autovalidate: true,
                            autocorrect: false,
                            validator: (_) {
                              return !state.isPasswordValid ? 'Invalid Password' : null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          width: 315,
                          height: 35,
                          child:
                          LoginButton(
                            onPressed: isLoginButtonEnabled(state)
                                ? _onFormSubmitted
                                : null,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}
