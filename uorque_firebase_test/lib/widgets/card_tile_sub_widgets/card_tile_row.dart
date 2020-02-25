import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class CardTileRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.width * 0.93,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.016),
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.15,
                child: Image.asset('assets/images/assistencia-tecnica.png')),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.34,
                child: FittedBox(
                  child: Text(
                    'Assistencia Tecnica',
                    style:
                        GoogleFonts.sourceSansPro(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.41,
                child: FittedBox(
                  child: Text(
                    'Manutencao de Computadores',
                    style: GoogleFonts.sourceSansPro(),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.13,
                  child: FittedBox(
                    child: Text(
                      '08/10/16',
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.08,
                  child: FittedBox(
                    child: Text(
                      '17:52',
                      style: GoogleFonts.openSans(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
