import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uorque_firebase_test/bloc/homePage_bloc/homePage_bloc.dart';
import 'package:uorque_firebase_test/bloc/homePage_bloc/homePage_event.dart';
import 'package:uorque_firebase_test/bloc/homePage_bloc/homePage_state.dart';
import 'package:uorque_firebase_test/repositories/auth_repo..dart';


class InformationPageParent extends StatelessWidget {
  FirebaseUser user;
  AuthRepo authRepo;

  InformationPageParent({@required this.user, @required thisauthRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(authRepo: authRepo),
      child: InformationPage(user: user,),
    );
  }
}





class InformationPage extends StatelessWidget {
  FirebaseUser user;

  HomePageBloc homePageBloc;

  InformationPage({@required this.user});

  @override
  Widget build(BuildContext context) {
    homePageBloc = BlocProvider.of<HomePageBloc>(context);

    return Scaffold(
      body: Column(children: <Widget>[
        Center(
          child: Text("Ola, ${user.email} "),
        ),
        RaisedButton.icon(
          onPressed: () {
            homePageBloc.add(LogOutEvent());
          },
          color: Colors.orangeAccent,
          icon: Icon(Icons.close),
          label: Text("Sair"),
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text(user.email),
          ),
          BlocListener < HomePageBloc, HomePageState>(
            listener: (context, state) {
              if (state is LogOutSuccessState) {
                Navigator.of(context).popAndPushNamed('/');
              }
            },
            child: BlocBuilder<HomePageBloc, HomePageState>(
              builder: (context, state) {
                if (state is LogOutInitialState) {
                  return Container();
                } else if (state is LogOutSuccessState) {
                  Navigator.of(context).popAndPushNamed('/');
                }
              },
            ),
          )
        ])
      ]),
    );
  }
}
