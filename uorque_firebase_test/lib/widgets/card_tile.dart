import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uorque_firebase_test/widgets/card_tile_sub_widgets/card_tile_container_left.dart';
import 'package:uorque_firebase_test/widgets/card_tile_sub_widgets/card_tile_container_right.dart';
import 'package:uorque_firebase_test/widgets/card_tile_sub_widgets/card_tile_row.dart';

class CardTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Container(
            
            height: MediaQuery.of(context).size.height * 0.24,
            width: MediaQuery.of(context).size.width * 0.93,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3
                )
              ],
              borderRadius: BorderRadius.circular(15)
            ),
            child: Stack(children: <Widget>[
              Positioned(
                child: CardTileRow(),
              ),
              Positioned(
                bottom: 0, left: 0, 
                child: CardContainerLeft()),
               Padding(
                 padding:EdgeInsets.only(
                   top:MediaQuery.of(context).size.height * 0.11,
                   bottom:MediaQuery.of(context).size.height * 0.02,
                   left:MediaQuery.of(context).size.width * 0.44),
                 child: VerticalDivider(color: Colors.black),
               ),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: CardContainerRight()),
                  Padding(
                    padding:EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.08,),
                    child: Divider(color: Colors.black,),
                  ),
            ]),
          ),
        ),
      ],
    );
  }
}
