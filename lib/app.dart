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

//
//void main(){
//  final UserRepository userRepository = UserRepository();
//  runApp(
//  BlocProvider(
//    create: (context) => AuthenticationBloc(userRepository: userRepository)
//      ..add(AppStarted()),
//    child: MyApp(userRepository: userRepository,),
//  ));
//}
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final GraphQLClient _client = new GqlClient().setup();

  @override
  Widget build(BuildContext context) {
    return GqlProvider(
      client: _client,
      child: MaterialApp(
        title: 'px',
        initialRoute: Routes.splashScreen,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
