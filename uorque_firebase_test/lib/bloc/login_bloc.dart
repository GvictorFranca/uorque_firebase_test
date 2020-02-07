import 'dart:async';


import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uorque_firebase_test/bloc/validate_bloc.dart';


enum LoginState {IDLE, LOADING, SUCCESS, FAIL}

class LoginBloc extends BlocBase with LoginValidators{

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _stateController = BehaviorSubject<LoginState>(); 



  Stream<String> get outEmail => _emailController.stream.transform(validateEmail);
  Stream<String> get outPassword => _passwordController.stream.transform(validatePassword);
  Stream<LoginState> get outState => _stateController.stream;

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  Stream<bool> get outSubmitValid => Rx.combineLatest2(
    outEmail, outPassword, (a,b) => true
  );

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
    _stateController.close();
    super.dispose();
  }

}