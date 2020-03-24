import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';


class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  UserRepository({
    FirebaseAuth firebaseAuth,
    GoogleSignIn googleSignIn
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();


  @override
  Future<String> getUser() async{
    return (await _firebaseAuth.currentUser()).uid;
  }

  @override
  Future<bool> isSignedIn() async{
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }


  @override
  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken
    );
    await _firebaseAuth.signInWithCredential(credential);

    return  _firebaseAuth.currentUser();
  }

  @override
  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut()
    ]);
  }

  @override
  Future<void> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<bool> hasToken()async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }

  @override
  Future<String> authenticated({String username, String password}) async{
    await Future.delayed(Duration(seconds: 1));
    return 'token';
  }

  @override
  Future<void> deleteToken() async{
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  @override
  Future<void> persistToken(String token) async{
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }



}
