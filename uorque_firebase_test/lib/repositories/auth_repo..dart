import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uorque_firebase_test/data_source/preferences_datasource.dart';
import 'package:uorque_firebase_test/utils/erro_codes.dart';
import 'dart:developer' as developer;

class AuthRepo {
  FirebaseAuth firebaseAuth;
  PreferencesDataSource preferencesDataSource;

  AuthRepo() {
    this.firebaseAuth = FirebaseAuth.instance;
    this.preferencesDataSource = PreferencesDataSource();
  }

  Future<FirebaseUser> signInEmailAndPassword(String email, String password) async {
    developer.log(FirebaseAuth.instance.toString(), name: "teste");
     try {
      AuthResult authresult = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      preferencesDataSource.setCurrentUserEmail(authresult.user.email);
      return authresult.user;


    } on PlatformException catch (e) {
      String authError = "";
      switch (e.code) {
        case ErrorCodes.ERROR_C0DE_NETWORK_ERROR:
          authError = ErrorMessages.ERROR_C0DE_NETWORK_ERROR;
          break;
        case ErrorCodes.ERROR_USER_NOT_FOUND:
          authError = ErrorMessages.ERROR_USER_NOT_FOUND;
          break;
        case ErrorCodes.ERROR_TOO_MANY_REQUESTS:
          authError = ErrorMessages.ERROR_TOO_MANY_REQUESTS;
          break;
        case ErrorCodes.ERROR_INVALID_EMAIL:
          authError = ErrorMessages.ERROR_INVALID_EMAIL;
          break;
        case ErrorCodes.ERROR_CODE_USER_DISABLED:
          authError = ErrorMessages.ERROR_CODE_USER_DISABLED;
          break;
        case ErrorCodes.ERROR_CODE_WRONG_PASSWORD:
          authError = ErrorMessages.ERROR_CODE_WRONG_PASSWORD;
          break;
        case ErrorCodes.ERROR_CODE_EMAIL_ALREADY_IN_USE:
          authError = ErrorMessages.ERROR_CODE_EMAIL_ALREADY_IN_USE;
          break;
        case ErrorCodes.ERROR_OPERATION_NOT_ALLOWED:
          authError = ErrorMessages.ERROR_OPERATION_NOT_ALLOWED;
          break;
        case ErrorCodes.ERROR_CODE_WEAK_PASSWORD:
          authError = ErrorMessages.ERROR_CODE_WEAK_PASSWORD;
          break;
        default:
          authError = ErrorMessages.DEFAULT;
          break;
      }
      throw Exception(authError);
    }
  }

  Future<void> signOut() async {
    preferencesDataSource.setCurrentUserEmail(null);
    return await firebaseAuth.signOut();
  }



  Future<String> getCurrentUserEmail() async {
    return await preferencesDataSource.getCurrentUserEmail();
  }
}
