import 'dart:async';


import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BlocBase{

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get outEmail => _emailController.stream;
  Stream<String> get outPassword => _passwordController.stream;


  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
    super.dispose();
  }

}