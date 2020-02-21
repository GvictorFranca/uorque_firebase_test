import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uorque_firebase_test/bloc/login_bloc.dart';

class UorqueHome extends StatefulWidget {
  @override
  _UorqueHomeState createState() => _UorqueHomeState();
}

class _UorqueHomeState extends State<UorqueHome> {
  

  List<String> categoryService = [
    "Assistencia Tecnica",
    "Aulas",
    "Autos",
    "Consultoria",
    "Design e Tecnologia"
  ];
  List<String> subtitleCategory = [
    "15.258 Profissionais",
    "1528 Profissionais",
    "5420 Profissionais",
    "2510 Profissionais",
    "2100 Profissionais"
  ];
  List<IconData> categoryIcons = [
    Icons.settings,
    Icons.save,
    Icons.access_alarm,
    Icons.accessible,
    Icons.radio,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Column(children: <Widget>[
        ListView()


      ],),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              title: Text(""),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                color: Colors.black,
              ),
              title: Text(""),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: Text(""),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
                color: Colors.black,
              ),
              title: Text(""),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: Text(""),
              backgroundColor: Colors.white),
        ],
      ),
    );
  }
}



/*
Column(children: <Widget>[
        Container(
          color: Colors.orangeAccent,
          height: 130,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: SizedBox(
              height: 40,
              width: 350,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      prefixIcon: Icon(Icons.search),
                      hintText: "Buscar por servico,profissional,categoria..."),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 30),
        ListView.builder(
            itemCount: categoryService.length,
            itemBuilder: (context, index) {
              child:
              Container(
                height: 50,
                width: 80,
                child: Row(
                  children: <Widget>[
                    Icon(categoryIcons[index]),
                    Column(
                      children: <Widget>[
                        Text("${categoryService[index]}"),
                        Text('${subtitleCategory[index]}'),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Icon(Icons.arrow_right),
                    )
                  ],
                ),
              );
            }),
      ]),
      */