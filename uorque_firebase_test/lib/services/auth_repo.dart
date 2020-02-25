import 'package:async/async.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {

  FirebaseUser firebaseUser;

  Future<String> signIn(String email , String password);

  Future<FirebaseUser> getCurrentUser();

  Future<void> signOut();


}
