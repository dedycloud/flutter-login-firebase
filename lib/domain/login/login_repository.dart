import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:px/data/login/user_repository.dart';

@Bind.toType(UserRepositoryImpl)
abstract class UserRepository {
  Future<FirebaseUser> signInWithGoogle() ;
  Future<void> signInWithCredentials( String email ,String password);
  Future<void> signOut() ;
  Future<bool> isSignedIn();
  Future<String> getUser();

  Future<bool> hasToken() ;
  Future<void> persistToken(String token);
  Future<void> deleteToken();
  Future<String> authenticated({@required String username, @required String password});
}
