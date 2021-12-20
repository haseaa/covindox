import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'user/login.dart';
import 'user/register.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(144, 228, 252, 10),
      body: Padding(
        padding: EdgeInsets.only(top: 5.0),
        child: Container(
            child: Column(
          children: <Widget>[
            new Container(
              margin: EdgeInsets.only(top: 120.0),
              alignment: Alignment.topCenter,
              child: new Text(
                "Welcome to\nCovindox",
                style: GoogleFonts.novaRound(
                  textStyle: TextStyle(color: Colors.white, fontSize: 60.0),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            new Container(
              margin: EdgeInsets.only(top: 80.0),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 70),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                color: HexColor("#ff9cbc"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Text(
                  "Login",
                  style: TextStyle(color: HexColor("#605c5c"), fontSize: 40.0),
                ),
              ),
            ),
            new Container(
              margin: EdgeInsets.only(top: 50.0),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                },
                color: HexColor("#e8fc9c"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Text(
                  "Register",
                  style: TextStyle(color: HexColor("#605c5c"), fontSize: 40.0),
                ),
              ),
            )
          ],
        )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 50.0),
              tooltip: "Home",
              title: Text("Home")),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital, size: 50.0),
            tooltip: "Vaccine",
            title: Text("Vaccine"),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.article, size: 50.0),
              tooltip: "Article",
              title: Text("Article")),
          BottomNavigationBarItem(
              icon: Icon(Icons.announcement_rounded, size: 50.0),
              tooltip: "News",
              title: Text("News"))
        ],
        backgroundColor: HexColor("#18f4b4"),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
      ),
    );
  }
}
