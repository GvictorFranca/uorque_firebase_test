import 'package:firebase_auth/firebase_auth.dart';
import 'package:uorque_firebase_test/model/user_model.dart';

class Mapper {
  UserModel firebaseUserToModel(FirebaseUser firebaseUser) {
  return UserModel(firebaseUser.email);
 }
}