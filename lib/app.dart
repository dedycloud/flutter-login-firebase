import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:px/common/network/gql_client.dart';
import 'package:px/common/network/gql_provider.dart';
import 'package:px/common/routes/routes.dart';
import 'package:px/common/routes/routing.dart';
import 'package:px/domain/login/login_repository.dart';
import 'package:px/presentation/screens/home/home_screen.dart';
import 'package:px/presentation/screens/login/bloc/Authentication/authentication_bloc.dart';
import 'package:px/presentation/screens/login/login_screen.dart';

void main(){
  final UserRepository userRepository = UserRepository();
  runApp(
  BlocProvider(
    create: (context) => AuthenticationBloc(userRepository: userRepository)
      ..add(AppStarted()),
    child: MyApp(userRepository: userRepository,),
  ));
}

class MyApp extends StatelessWidget {
  final GraphQLClient _client = new GqlClient().setup();
  final UserRepository _userRepository;

   MyApp({Key key, UserRepository userRepository}) :
        assert(userRepository != null), _userRepository = userRepository, super(key: key);


  @override
  Widget build(BuildContext context) {
    return GqlProvider(
      client: _client,
      child: MaterialApp(
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is Uninitialized) {
              return Scaffold(
                body: Center(
                  child: Container(
                      child: Image.asset(
                        'assets/images/px.png',
                        width: 113,
                        height: 73,
                      )),
                ),
              );
            }
            if (state is Unauthenticated) {
              // return RegisterScreen(userRepository: _userRepository);
              return LoginScreen(userRepository: _userRepository);
            }
            if (state is Authenticated) {
              return HomeScreen(name: state.displayName);
            }
            return null;
          },
        ),
            onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
