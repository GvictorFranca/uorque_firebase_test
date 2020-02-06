import 'package:flutter/material.dart';
import 'package:uorque_firebase_test/route_generator.dart';


class SignInPageOne extends StatefulWidget {
  @override
  _SignInPageOneState createState() => _SignInPageOneState();
}

class _SignInPageOneState extends State<SignInPageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left:10,top:30,),
        child: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: (){
            Navigator.of(context).pushNamed('/home');
          },),
      )
    );
  }
}