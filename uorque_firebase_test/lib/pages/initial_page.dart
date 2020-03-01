import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uorque_firebase_test/styles/colors.dart';
import 'package:uorque_firebase_test/styles/icons.dart';
import 'package:uorque_firebase_test/styles/textContants.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    var mediaQueryEntrar = MediaQuery.of(context).size.width * 0.82;
    var mediaQueryMarginColumn = MediaQuery.of(context).size.height * 0.049;

    var mediaQueryIconWidth = MediaQuery.of(context).size.width / 3;
    var mediaQueryIconHeight = MediaQuery.of(context).size.height * 0.137;

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
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  left: MediaQuery.of(context).size.width * 0.08,
                  right: MediaQuery.of(context).size.width * 0.08),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.78,
                
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: mediaQueryIconHeight,
                      width: mediaQueryIconWidth,
                      child: SvgPicture.asset(iconUorque),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.08),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.047,
                        width: MediaQuery.of(context).size.width * 0.70,
                        child: DecoratedBox(
                          decoration: BoxDecoration(),
                          child: FittedBox(
                            child: Text(
                              title,
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                color: titleColor,
                              ),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.0089),
                    SizedBox(
                      // height: MediaQuery.of(context).size.height * 0.025,
                      width: double.infinity,
                      child: DecoratedBox(
                        decoration: BoxDecoration(),
                        child: FittedBox(
                          child: Text(
                            subTitile,
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold,
                              color: subTitleColor,
                            ),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.035),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.078,
                        width: double.infinity,
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
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.078,
                      width: double.infinity,
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
                    //width: double.infinity,
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.119),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                        width: MediaQuery.of(context).size.width * 0.30,
                        child: DecoratedBox(
                          decoration: BoxDecoration(),
                          child: FittedBox(
                            child: Text(
                              "Cadastrar Depois >",
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                color: subTitleColor,
                              ),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05),
                      child: SizedBox(
                        //height: MediaQuery.of(context).size.height * 0.025,
                        width: double.infinity,
                        child: DecoratedBox(
                          decoration: BoxDecoration(),
                          child: FittedBox(
                            child: Text(
                              "Ao logar no Uorque, você concorda com nossos Termos e\n Politica de Privacidade",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                color: subTitleColor,
                              ),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height* 0.0919,
              width: double.maxFinite,
              color: Colors.grey.withOpacity(0.2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.23),
                    child: Text('É um profissional?'),
                  ),
                  Text('Faça seu cadastro',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ))
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}

/* Padding(
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
            */
