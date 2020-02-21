import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CardTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.red,
          height: MediaQuery.of(context).size.height * 0.28,
          width: MediaQuery.of(context).size.height * 0.93,
        ),
        Divider(),
        Container(
          height: MediaQuery.of(context).size.height * 0.28,
          width: MediaQuery.of(context).size.height * 0.93,
          color: Colors.blue,
          child: Row(
            children: <Widget>[
              SvgPicture.asset('assets/images/ASSISTENCIA T.svg'),
              Column(
                children: <Widget>[
                  Text(
                    'Assistencia Tecnica',
                    style: GoogleFonts.sourceSansPro(fontSize: 12),
                  ),
                  Text(
                    'Manutencao de Computadores',
                    style: GoogleFonts.sourceSansPro(fontSize: 12),
                  ),
                ],
              ),
              Column(children: <Widget>[
                Text('08/10/2016',
                style: GoogleFonts.sourceSansPro(fontSize: 30),
              ),
                    Text('17:52',
                style: GoogleFonts.sourceSansPro(fontSize: 30),
              ),
              
              ],),
            ],
          ),
        )
      ],
    );
  }
}
