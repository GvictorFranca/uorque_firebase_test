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
              padding: const EdgeInsets.only(left: 290),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/second');
                },
                child: Text(
                  "Entrar",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            /*Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/UORQUE.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),*/
            Image.asset('assets/images/UORQUE.png'),
          ],
        ),
      ),
    );
  }
}
