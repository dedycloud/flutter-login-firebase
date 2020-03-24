import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:px/common/config/injector.dart';
import 'package:px/data/login/user_repository.dart';
import 'package:px/domain/login/login_repository.dart';
import 'package:px/presentation/screens/login/Authentication.dart';
import 'package:px/presentation/screens/login/bloc/Authentication/authentication_bloc.dart';

import 'package:px/presentation/screens/register/bloc/register_bloc.dart';
import 'package:px/presentation/screens/register/register_screen.dart';

import 'routes.dart';

import 'package:px/presentation/screens/splash/splash_screen.dart';
import 'package:px/presentation/screens/error/error_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => _buildSplashScreen());

      case Routes.registerScreen:
        return MaterialPageRoute(builder: (context) => _buildRegisterScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) => _buildAuthenticate());

      default:
        return MaterialPageRoute(builder: (_) => _buildErrorScreen());
    }
  }

  static Widget _buildSplashScreen() {
    return SplashScreen();
  }
  static Widget _buildAuthenticate() {
    final UserRepository userRepository = UserRepositoryImpl();
    return   BlocProvider(
      create: (context) => AuthenticationBloc(userRepository: userRepository)
        ..add(AppStarted()),
      child: Authentication(userRepository: userRepository,),
    );
  }

  static Widget _buildRegisterScreen() {
    return BlocProvider<RegisterBloc>(
      create: (BuildContext context) => getIt<RegisterBloc>(),
      child: RegisterScreen(),
    );
  }

  static Widget _buildErrorScreen() {
    return ErrorScreen();
  }
}
