import 'package:flutter/material.dart';
import 'package:uorque_firebase_test/pages/home_page.dart';
import 'package:uorque_firebase_test/pages/login_page.dart';
import 'package:uorque_firebase_test/pages/sign_in_page_one.dart';
import 'package:uorque_firebase_test/pages/uorque_home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    

    switch (settings.name) {
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
  }
}
