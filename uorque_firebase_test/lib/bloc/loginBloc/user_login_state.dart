import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';


abstract class UserLoginState extends Equatable {}

class LoginInitialState extends UserLoginState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class LoginLoadingState extends UserLoginState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class LoginSuccesseState extends UserLoginState {
  @override
  
  FirebaseUser user;

  LoginSuccesseState(@required this.user);

  List<Object> get props => null;
}

class LoginFailureState extends UserLoginState {
 
  String message;

  LoginFailureState(@required this.message);
 
  @override

  List<Object> get props => null;
}