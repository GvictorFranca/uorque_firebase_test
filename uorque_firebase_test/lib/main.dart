import 'package:flutter/material.dart';
import 'package:uorque_firebase_test/pages/home_page.dart';
import 'package:uorque_firebase_test/pages/login_page.dart';
import 'package:uorque_firebase_test/pages/uorque_home.dart';
import 'package:uorque_firebase_test/routes/route_generator.dart';



void main() => runApp(MyApp());

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
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute
    );
  }
}

