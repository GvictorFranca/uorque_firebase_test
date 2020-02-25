import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardContainerLeft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.468,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15))
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height* 0.02),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.185,
                  child: FittedBox(child: Text('PROFISSIONAL',
                  style: GoogleFonts.openSans(),))),
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.050,
                width: MediaQuery.of(context).size.width * 0.11,
                child: Image.asset('assets/images/aberto.png')),
            Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height* 0.02),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.185,
                  
                  child: FittedBox(child: Text('Edineidison',
                  style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),))),
            )
          ],
        ),
      ),
    );
  }
}
