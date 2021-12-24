import 'package:covindox_flutter/registervaccine/checker.dart';
import 'package:covindox_flutter/registervaccine/form.dart';
import 'package:covindox_flutter/registervaccine/showresult.dart';
import 'package:covindox_flutter/user/userprofile.dart';
import 'package:covindox_flutter/user_home.dart';
import 'package:provider/provider.dart';
import 'package:covindox_flutter/auth_user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Session extends StatefulWidget {
  const Session({Key? key}) : super(key: key);

  @override
  _MainSession createState() => _MainSession();
}

class _MainSession extends State<Session> {
  int currentIndex = 0;
  final screens = [
    UserPage(),
    Profile(),
    Profile(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    child:
    return Scaffold(
      backgroundColor: Color.fromRGBO(144, 228, 252, 10),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => currentIndex = index),
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
