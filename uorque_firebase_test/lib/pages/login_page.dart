import 'package:flutter/material.dart';
import 'package:uorque_firebase_test/bloc/login_bloc.dart';
import 'package:uorque_firebase_test/widgets/input_field.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.arrow_left),
              onPressed: () {
                Navigator.of(context).pushNamed('/home');
              }),
        ],
      ),
      body: Column(children: <Widget>[
        SizedBox(height: 250),
        Text("Entrar"),
        InputField(
          hint: "Usuario",
          obscure: false,
          stream: _loginBloc.outEmail,
          onChanged: _loginBloc.changeEmail,
        ),
        InputField(
          hint: "Senha",
          obscure: true,
          stream: _loginBloc.outPassword,
          onChanged: _loginBloc.changePassword,
        ),
        RaisedButton(
          onPressed:(){},
          color: Colors.orangeAccent,
          child: Text("Entrar"),
        )
      ]),
    );
  }
}
