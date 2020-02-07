import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uorque_firebase_test/styles/colors.dart';
import 'package:uorque_firebase_test/styles/icons.dart';
import 'package:uorque_firebase_test/styles/textContants.dart';

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
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            SizedBox(height: 100),
            SizedBox(
              height: 92,
              width: 136,
              child: SvgPicture.asset(iconUorque),
            ),
            SizedBox(height: 50),
            Center(
              child: Text(
                title,
                style: GoogleFonts.openSans(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: titleColor,
                ),
              ),
            ),
            Center(
              child: Text(
                subTitile,
                style: GoogleFonts.openSans(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: subTitleColor,
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 50,
              width: 310,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: faceButtonColor,
                onPressed: () {},
                child: Center(
                  child: Text(
                    facebookTitle,
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 310,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.of(context).pushNamed('/second');
                },
                child: Center(
                  child: Text(
                    createAc,
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w500, 
                        color: titleColor),
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
