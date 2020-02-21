import 'package:flutter/material.dart';
import 'package:sailor/sailor.dart';
import 'package:uorque_firebase_test/pages/home_page.dart';
import 'package:uorque_firebase_test/pages/login_page.dart';
import 'package:uorque_firebase_test/pages/sign_in_page_one.dart';
import 'package:uorque_firebase_test/pages/uorque_home.dart';

import 'package:uorque_firebase_test/routes/route_generator.dart';
import 'package:uorque_firebase_test/widgets/card_tile.dart';

void main() {
  Routes.createRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FireBaseUorque',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        onGenerateRoute: Routes.sailor.generator(),
        navigatorKey: Routes.sailor.navigatorKey,
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
            return LoginPage();
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
            return LoginPage();
          }),
      SailorRoute(
          name: '/uorqueHome',
          builder: (context, args, params) {
            return UorqueHome();
          }),
    ]);
  }
}

/*switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/second':
        return MaterialPageRoute(builder: (_) => SignInPageOne());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/uorqueHome':
        return MaterialPageRoute(builder: (_) => UorqueHome());
    }

  */
