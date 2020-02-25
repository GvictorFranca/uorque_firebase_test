import 'package:async/async.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:uorque_firebase_test/services/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;
  @override
  Future<String> signIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  @override
  Future<void> signOut() async {
    firebaseUser = null;

    return await _firebaseAuth.signOut();
  }
}
