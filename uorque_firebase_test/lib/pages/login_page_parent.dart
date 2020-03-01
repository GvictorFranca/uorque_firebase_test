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
      create: (context) => UserLoginBloc(),
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
      body: Container(
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
            Container(
              child: TextField(
                controller: emailCntrlr,
                decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: "E-mail",
                  hintText: "E-mail",
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Container(
              child: TextField(
                controller: passCntrlr,
                obscureText: true,
                decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  hintText: "Password",
                  
                ),
                keyboardType: TextInputType.text
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: RaisedButton(
                    color: Colors.cyan,
                    child: Text("Login"),
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
                Container(
                  child: RaisedButton(
                    color: Colors.cyan,
                    child: Text("Sign Up Now"),
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed('/second');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInitialUi() {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Text(
        "Enter Login Credentials",
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.teal,
        ),
      ),
    );
  }

  Widget buildLoadingUi() {
    return Center(
      child: CircularProgressIndicator(),
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

  void navigateToHomeScreen(BuildContext context, FirebaseUser user) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return HomePageParent(user: user, authRepo: authRepo);
    }));
  }

  /*void navigateToSignUpScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return SignUpPageParent(userRepository: userRepository);
    }));
  }
  */
}

/*Column(children: <Widget>[
        TextFormField(
          decoration: InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'Digite seu email',
            labelText: 'Email',
          ),
          validator: (String value) {
            return value.contains('@') ? 'Do not use the @ char.' : null;
          },
        ),
        TextFormField(
          decoration: InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'Digite sua Senha',
            labelText: 'Senha',
          ),
          validator: (String value) {
            return value.contains('@') ? 'Do not use the @ char.' : null;
          },
        ),
        RaisedButton(onPressed: () {})
      ]),
    );
  }
}

Widget buildFailure(String message) {
  return Text(message, style: TextStyle(color: Colors.black));
}
*/
