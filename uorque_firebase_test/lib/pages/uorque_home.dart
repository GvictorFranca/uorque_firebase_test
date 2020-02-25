import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uorque_firebase_test/bloc/login_bloc.dart';
import 'package:uorque_firebase_test/pages/information_page.dart';
import 'package:uorque_firebase_test/widgets/card_tile.dart';
import 'package:uorque_firebase_test/icons/my_flutter_app_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UorqueHome extends StatefulWidget {
  @override
  _UorqueHomeState createState() => _UorqueHomeState();
}

class _UorqueHomeState extends State<UorqueHome> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        title: Center(
            child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.17,
          child: FittedBox(
            child: Text(
              'Serviços',
              style: GoogleFonts.openSans(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        )),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: <Widget>[
        Container(),
        Container(),
        ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            CardTile(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.014,
            ),
            CardTile(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.014,
            ),
            CardTile(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.014,
            ),
            CardTile()
          ],
        ),
        Container(),
        InformationPage()
      ]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (p) {
          _pageController.animateToPage(p, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              title: Padding(padding: EdgeInsets.all(0)),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              title: Padding(padding: EdgeInsets.all(0)),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              title: Padding(padding: EdgeInsets.all(0)),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              title: Padding(padding: EdgeInsets.all(0)),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              title: Padding(padding: EdgeInsets.all(0)),
              backgroundColor: Colors.white),
        ],
      ),
    );
  }
}
