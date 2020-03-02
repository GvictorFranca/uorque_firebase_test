import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uorque_firebase_test/bloc/loginBloc/user_login_bloc.dart';
import 'package:uorque_firebase_test/bloc/loginBloc/user_login_event.dart';
import 'package:uorque_firebase_test/bloc/loginBloc/user_login_state.dart';
import 'package:uorque_firebase_test/pages/uorque_homepage/home_page_aparent.dart';
import 'package:uorque_firebase_test/repositories/auth_repo..dart';

import 'package:uorque_firebase_test/widgets/input_field.dart';

class LoginPageParent extends StatelessWidget {
  AuthRepo authRepo;

  LoginPageParent({@required this.authRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserLoginBloc(authRepo: AuthRepo()),
      child: LoginPAge(),
    );
  }
}

class LoginPAge extends StatelessWidget {
  TextEditingController emailCntrlr = TextEditingController();
  TextEditingController passCntrlr = TextEditingController();
  UserLoginBloc userLoginBloc;
  AuthRepo authRepo;

  LoginPAge({@required this.authRepo});

  @override
  Widget build(BuildContext context) {
    userLoginBloc = BlocProvider.of<UserLoginBloc>(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.82,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: BlocListener<UserLoginBloc, UserLoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccesseState) {
                        navigateToHomeScreen(context, state.user);
                      }
                    },
                    child: BlocBuilder<UserLoginBloc, UserLoginState>(
                      builder: (context, state) {
                        if (state is LoginInitialState) {
                          return buildInitialUi();
                        } else if (state is LoginLoadingState) {
                          return buildLoadingUi();
                        } else if (state is LoginFailureState) {
                          return buildFailureUi(state.message);
                        } else if (state is LoginSuccesseState) {
                          emailCntrlr.text = "";
                          passCntrlr.text = "";
                          return Container();
                        }
                      },
                    ),
                  ),
                ),
             
                Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.696,
                      bottom: MediaQuery.of(context).size.height * 0.024),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.24,
                    child: FittedBox(
                      child: Text(
                        "Entrar",
                        style: GoogleFonts.openSans(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.696,
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.030,
                    width: MediaQuery.of(context).size.width * 0.31,
                    child: FittedBox(
                      child: Text("EMAIL",
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold, color: Colors.grey)),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.88,
                  child: TextFormField(
                    controller: emailCntrlr,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.032),
                Padding(
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.694,
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.030,
                    width: MediaQuery.of(context).size.width * 0.31,
                    child: FittedBox(
                      child: Text("SENHA",
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold, color: Colors.grey)),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.88,
                  child: TextFormField(
                      controller: passCntrlr,
                      obscureText: true,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.white,
                        labelStyle: GoogleFonts.openSans(),
                      ),
                      keyboardType: TextInputType.text),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.53,
                    top: MediaQuery.of(context).size.height * 0.041,
                    bottom: MediaQuery.of(context).size.height * 0.10,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.29,
                    child: FittedBox(
                      child: Text(
                        "Recuperar senha",
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.34,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: Colors.orange,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Entrar",
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                            )
                          ],
                        ),
                        textColor: Colors.white,
                        onPressed: () {
                          userLoginBloc.add(
                            UserLoginButtonPressedEvent(
                              email: emailCntrlr.text,
                              password: passCntrlr.text,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInitialUi() {
    return Container();
  }

  Widget buildLoadingUi() {
    return Center(
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget buildFailureUi(String message) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(5.0),
          child: Text(
            "Fail $message",
            style: TextStyle(color: Colors.red),
          ),
        ),
        buildInitialUi(),
      ],
    );
  }

  void navigateToHomeScreen(context, user) {
    Navigator.of(context).popAndPushNamed("/homePageParent");
  }

  void navigateToLoginInitial(context) {
    Navigator.of(context).popAndPushNamed('/');
  }
}
