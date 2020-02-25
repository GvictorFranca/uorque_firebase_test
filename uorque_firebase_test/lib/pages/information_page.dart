import 'package:flutter/material.dart';
import 'package:uorque_firebase_test/bloc/login_bloc.dart';

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {

  final _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: <Widget> [
          Center(child: Text("Ola, "),),
          StreamBuilder<Object>(
            stream: _loginBloc.outSubmitValid,
            builder: (context, snapshot) {
              return RaisedButton.icon(
                onPressed: (){
                  _loginBloc.signOut;
                  Navigator.of(context).popAndPushNamed('/');
                },
                color: Colors.orangeAccent,
                icon: Icon(Icons.accessibility),
                label: Text("Sair"),
              );
            }
          )
        ]
      ),
    );
  }
}