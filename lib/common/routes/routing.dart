import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:px/common/config/injector.dart';
import 'package:px/presentation/screens/login/login_screen.dart';
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
        return MaterialPageRoute(builder: (context) => _buildLoginScreen());

      default:
        return MaterialPageRoute(builder: (_) => _buildErrorScreen());
    }
  }

  static Widget _buildSplashScreen() {
    return SplashScreen();
  }

  static Widget _buildLoginScreen() {
    return LoginScreen();
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