import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uorque_firebase_test/bloc/homePage_bloc/homePage_bloc.dart';
import 'package:uorque_firebase_test/bloc/homePage_bloc/homePage_event.dart';
import 'package:uorque_firebase_test/bloc/homePage_bloc/homePage_state.dart';

import 'package:uorque_firebase_test/pages/uorque_homepage/information_page.dart';
import 'package:uorque_firebase_test/repositories/auth_repo..dart';
import 'package:uorque_firebase_test/widgets/card_tile.dart';

class HomePageParent extends StatefulWidget {
  FirebaseUser user;
  AuthRepo authRepo;

  HomePageParent({@required this.user, this.authRepo});

  @override
  _HomePageParentState createState() => _HomePageParentState();
}

class _HomePageParentState extends State<HomePageParent> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(authRepo: widget.authRepo),
      child: HomePage(user: widget.user, authRepo: widget.authRepo),
    );
  }
}

class HomePage extends StatefulWidget {
  FirebaseUser user;
  AuthRepo authRepo;

  HomePage({@required this.user, @required this.authRepo});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageBloc homePageBloc;
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
    homePageBloc = BlocProvider.of<HomePageBloc>(context);
    homePageBloc.add(FetchUserEvent());

    return BlocListener < HomePageBloc, HomePageState>(
            listener: (context, state) {
              if (state is LogOutSuccessState) {
                Navigator.of(context).popAndPushNamed('/');
              }
            },
            child: BlocBuilder<HomePageBloc, HomePageState>(
              builder: (context, state) {
                if (state is HomePageInitialState) {
                  homePageBloc.add(FetchUserEvent());
                  return Container();
                } else if (state is HomePageLoadedState) {
                  return body(homePageBloc);
                } else {
                  return Container();
                }
              },
            ),
          );
    
}

Widget body(HomePageBloc homePageBloc) {
return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        actions: <Widget>[
          getHeader(homePageBloc.state),
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: (){
              homePageBloc.add(LogOutEvent());
            },
          )
        ],
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
          controller: _pageController,
          onPageChanged: (p) {},
          physics: NeverScrollableScrollPhysics(),
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
            InformationPage(),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (p) {
          _pageController.animateToPage(p,
              duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
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



Widget getHeader(HomePageState state) {
  if (state is HomePageLoadedState) {
    return Text('${state.userEmail}');
  } else {
    return Container();
  }
    
} 
