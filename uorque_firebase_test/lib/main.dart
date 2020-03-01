
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sailor/sailor.dart';
import 'package:uorque_firebase_test/bloc/auth_bloc/auth_bloc.dart';
import 'package:uorque_firebase_test/bloc/auth_bloc/auth_event.dart';
import 'package:uorque_firebase_test/bloc/auth_bloc/auth_state.dart';
import 'package:uorque_firebase_test/pages/initial_page.dart';
import 'package:uorque_firebase_test/pages/login_page_parent.dart';
import 'package:meta/meta.dart';

import 'package:uorque_firebase_test/pages/sign_in_page_one.dart';
import 'package:uorque_firebase_test/pages/uorque_homepage/home_page_aparent.dart';
import 'package:uorque_firebase_test/repositories/auth_repo..dart';

void main() {
  Routes.createRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  AuthRepo authRepo = AuthRepo();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FireBaseUorque',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        onGenerateRoute: Routes.sailor.generator(),
          navigatorKey: Routes.sailor.navigatorKey,
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => AuthBloc(authRepo: authRepo)..add(AppStartedEvent()),
          child: App(authRepo: authRepo),
          
        ));
  }
}

class App extends StatelessWidget {


   AuthRepo authRepo;

  App({@required this.authRepo});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitialState) {
          return SplashScreen();
        } else if (state is AuthenticatedState) {
          return HomePageParent(user: state.user, authRepo: authRepo,);
        } else if (state is UnAuthenticatedState) {
          return LoginPageParent();
        }
      },
    );
  }
}

class Routes {
  static final sailor = Sailor();

  static void createRoutes() {
    sailor.addRoutes([
      SailorRoute(
          name: '/',
          builder: (context, args, params) {
            return InitialPage();
          }),
      SailorRoute(
          name: '/second',
          builder: (context, args, params) {
            return SignInPageOne();
          }),
      SailorRoute(
          name: '/home',
          builder: (context, args, params) {
            return HomePage();
          }),
      SailorRoute(
          name: '/login',
          builder: (context, args, params) {
            return LoginPageParent();
          }),
      SailorRoute(
          name: '/homePageParent',
          builder: (context, args, params) {
            return HomePageParent();
          }),
    ]);
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
    );
  }
}
