import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uorque_firebase_test/bloc/login_bloc.dart';

import 'package:uorque_firebase_test/widgets/input_field.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final _loginBloc = LoginBloc();

  @override
  void initState() {
    super.initState();

    _loginBloc.outState.listen((state) {
      switch (state) {
        case LoginState.SUCCESS:
          Navigator.of(context).popAndPushNamed('/uorqueHome');
          break;
        case LoginState.FAIL:
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Erro'),
                    content: Text('Login Invalido'),
                  ));
          break;
        case LoginState.LOADING:
        case LoginState.IDLE:
      }
    });
  }

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
      body: StreamBuilder<LoginState>(
          stream: _loginBloc.outState,
          initialData: LoginState.IDLE,
          builder: (context, snapshot) {
            switch (snapshot.data) {
              case LoginState.LOADING:
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.orangeAccent),
                  ),
                );
              case LoginState.FAIL:
              case LoginState.SUCCESS:
              case LoginState.IDLE:
                return Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: SingleChildScrollView(
                    child: Container(
                      color: Colors.white12,
                      child: Column(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 200),
                          child: Text(
                            "Entrar",
                            style: GoogleFonts.openSans(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
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
                        StreamBuilder<bool>(
                            stream: _loginBloc.outSubmitValid,
                            builder: (context, snapshot) {
                              return RaisedButton(
                                onPressed:
                                    snapshot.hasData ? _loginBloc.submit : null,
                                color: Colors.orangeAccent,
                                child: Text("Entrar"),
                              );
                            })
                      ]),
                    ),
                  ),
                );
            }
          }),
    );
  }
}
