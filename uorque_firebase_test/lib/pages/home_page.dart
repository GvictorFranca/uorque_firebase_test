import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 320),
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "Entrar",
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 100),
            Center(child: Image.asset('assets/images/UORQUE.png')),
            SizedBox(height: 50),
            Center(
              child: Text(
                "Ola! E novo por aqui ?",
                style: GoogleFonts.openSans(
                    fontSize: 25, fontWeight: FontWeight.bold)
              ),
            ),
            Center(
              child: Text(
                "Escolha como prefere iniciar seu cadastro",
                style: GoogleFonts.openSans(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 60,
              width: 300,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.blueGrey,
                onPressed: () {},
                child: Center(
                  child: Text(
                    'Entrar com Facebook',
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 60,
              width: 300,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.of(context).pushNamed('/second');
                },
                child: Center(
                  child: Text(
                    'Criar Conta',
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w500, color: Colors.black54),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
