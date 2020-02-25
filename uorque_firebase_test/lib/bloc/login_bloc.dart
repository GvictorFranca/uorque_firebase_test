import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uorque_firebase_test/bloc/validate_bloc.dart';
import 'package:uorque_firebase_test/failure/login_failure.dart';
import 'package:uorque_firebase_test/services/auth_repo.dart';
import 'package:uorque_firebase_test/services/auth_repo_impl.dart';

enum LoginState { IDLE, LOADING, SUCCESS, FAIL }

class LoginBloc extends BlocBase with LoginValidators {
  AuthRepo _repo;

  FirebaseUser firebaseUser;

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _stateController = BehaviorSubject<LoginState>();

  Stream<String> get outEmail =>
      _emailController.stream.transform(validateEmail);
  Stream<String> get outPassword =>
      _passwordController.stream.transform(validatePassword);
  Stream<LoginState> get outState => _stateController.stream;

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  Stream<bool> get outSubmitValid =>
      Observable.combineLatest2(outEmail, outPassword, (a, b) => true);

  LoginBloc() {
    FirebaseAuth.instance.onAuthStateChanged.listen((user) {
      if (user != null) {
        _stateController.add(LoginState.SUCCESS);
        signOut();
      } else {
        _stateController.add(LoginState.IDLE);
      }
    });
  }

  void submit() async {
    final email = _emailController.value;
    final password = _passwordController.value;

    _stateController.add(LoginState.LOADING);

    await _repo.signIn(email, password).catchError((e) {
      _stateController.add(LoginState.FAIL);
    });
  }

  void getCurrentUser() async {
    await _repo.getCurrentUser();
  }

  void signOut() async {
    await _repo.signOut();
  }

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
    _stateController.close();
    super.dispose();
  }
}
