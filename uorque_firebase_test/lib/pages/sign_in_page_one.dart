import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uorque_firebase_test/route_generator.dart';

class SignInPageOne extends StatefulWidget {
  @override
  _SignInPageOneState createState() => _SignInPageOneState();
}

class _SignInPageOneState extends State<SignInPageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent.withOpacity(0.0),
        elevation: 0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.arrow_left),
              onPressed: () {
                Navigator.of(context).pushNamed('/home');
              })
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Text(
              'Qual seu nome ?',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Text(
              'Para sua segurança, iremos exibir apenas o \nseu primeiro nome para os profissionais ',
              style:
                  GoogleFonts.roboto(fontWeight: FontWeight.w300, fontSize: 15),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: SizedBox(
              width: 300,
              child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Nome', labelStyle: GoogleFonts.roboto())),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: SizedBox(
              width: 300,
              child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Sobrenome',
                      labelStyle: GoogleFonts.roboto())),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 150.0),
            child: SizedBox(
              height: 50,
              width: 140,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: Colors.orangeAccent,
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
