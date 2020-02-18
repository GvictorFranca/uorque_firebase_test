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
    var mediaQueryEntrar = MediaQuery.of(context).size.width * 0.82;
    var mediaQueryMarginColumn = MediaQuery.of(context).size.height * 0.049;
    var mediaQueryIconTopColumn = MediaQuery.of(context).size.height * 0.085;
    var mediaQueryIconWidth = MediaQuery.of(context).size.width /3;
    var mediaQueryIconHeight = MediaQuery.of(context).size.height * 0.13;
    var mediaQueryTitleWidth = MediaQuery.of(context).size.width* 0.58;
    var mediaQueryTitleHeight = MediaQuery.of(context).size.width* 0.03;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: EdgeInsets.only(top: mediaQueryMarginColumn),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: mediaQueryEntrar),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/login');
                },
                child: Text(
                  "Entrar",
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: mediaQueryIconTopColumn),
              child: SizedBox(
                height: mediaQueryIconHeight,
                width: mediaQueryIconWidth,
                child: SvgPicture.asset(iconUorque),
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: SizedBox(
                height: 27,
                width: 221,
                child: Text(
                  title,
                  style: GoogleFonts.openSans(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: titleColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 6),
            Center(
              child: SizedBox(
                height: 17,
                width: 311,
                child: Text(
                  subTitile,
                  style: GoogleFonts.openSans(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: subTitleColor,
                  ),
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
                        fontWeight: FontWeight.w500, color: titleColor),
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
