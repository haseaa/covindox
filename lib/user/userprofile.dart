import 'dart:convert';

import 'package:covindox_flutter/user/edit_profile.dart';
import 'package:covindox_flutter/user_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:covindox_flutter/auth_user.dart';
import 'package:covindox_flutter/main.dart';

class UserData {
  late final String fullname;
  late final String phone;
  late final String address;
  late final String vaksin1;
  late final String vaksin2;

  UserData({
    required this.fullname,
    required this.phone,
    required this.address,
    required this.vaksin1,
    required this.vaksin2,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    String fullname = "Belum memasukkan";
    String phone = "Belum memasukkan";
    String address = "Belum memasukkan";
    String vaksin1 = "Belum memasukkan";
    String vaksin2 = "Belum memasukkan";

    if (json["fullname"] != null) {
      fullname = json["fullname"];
    }
    if (json["bod"] != null) {
      phone = json["phone"];
    }
    if (json["phone"] != null) {
      address = json["address"];
    }
    if (json["province"] != null) {
      vaksin1 = json["vaksin1"];
    }
    if (json["address"] != null) {
      vaksin2 = json["vaksin2"];
    }

    return UserData(
      fullname: fullname,
      phone: phone,
      address: address,
      vaksin1: vaksin1,
      vaksin2: vaksin2,
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  UserProfile createState() => UserProfile();
}

class UserProfile extends State<Profile> {
  late UserData userdata;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final request = Provider.of<CookieRequest>(context, listen: false);
      request
          .get('https://covindox.herokuapp.com/get-profile/json')
          .then((value) {
        super.setState(() {
          userdata = UserData.fromJson(value);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(144, 228, 252, 10),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 100.0, bottom: 50.0),
                alignment: Alignment.topCenter,
                child: Text("User Profile",
                    style: GoogleFonts.novaRound(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 60.0),
                    )),
              ),
              Container(
                child: Column(
                  children: [
                    new Container(
                      alignment: Alignment.topLeft,
                      color: HexColor("#a8f4b4"),
                      margin: EdgeInsets.only(left: 50.0, right: 50.0),
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20.0),
                          child: Column(
                            children: [
                              Text(
                                "Fullname",
                                style: GoogleFonts.novaRound(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 30.0),
                                ),
                              ),
                              new Container(
                                padding:
                                    EdgeInsets.only(top: 10.0, bottom: 10.0),
                                color: HexColor("#2596be"),
                                child: Text(
                                  userdata.fullname,
                                  style: GoogleFonts.novaRound(
                                    textStyle: const TextStyle(
                                        color: Colors.white, fontSize: 30.0),
                                  ),
                                ),
                              ),
                              Text(
                                "Phone",
                                style: GoogleFonts.novaRound(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 30.0),
                                ),
                              ),
                              new Container(
                                padding:
                                    EdgeInsets.only(top: 10.0, bottom: 10.0),
                                color: HexColor("#2596be"),
                                child: Text(
                                  userdata.phone,
                                  style: GoogleFonts.novaRound(
                                    textStyle: const TextStyle(
                                        color: Colors.white, fontSize: 30.0),
                                  ),
                                ),
                              ),
                              Text(
                                "Address",
                                style: GoogleFonts.novaRound(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 30.0),
                                ),
                              ),
                              new Container(
                                padding:
                                    EdgeInsets.only(top: 10.0, bottom: 10.0),
                                color: HexColor("#2596be"),
                                child: Text(
                                  userdata.address,
                                  style: GoogleFonts.novaRound(
                                    textStyle: const TextStyle(
                                        color: Colors.white, fontSize: 30.0),
                                  ),
                                ),
                              ),
                              Text(
                                "First Vaccine",
                                style: GoogleFonts.novaRound(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 30.0),
                                ),
                              ),
                              new Container(
                                padding:
                                    EdgeInsets.only(top: 10.0, bottom: 10.0),
                                color: HexColor("#2596be"),
                                child: Text(
                                  userdata.vaksin1,
                                  style: GoogleFonts.novaRound(
                                    textStyle: const TextStyle(
                                        color: Colors.white, fontSize: 30.0),
                                  ),
                                ),
                              ),
                              Text(
                                "Second Vaccine",
                                style: GoogleFonts.novaRound(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 30.0),
                                ),
                              ),
                              new Container(
                                padding:
                                    EdgeInsets.only(top: 10.0, bottom: 10.0),
                                color: HexColor("#2596be"),
                                child: Text(
                                  userdata.vaksin2,
                                  style: GoogleFonts.novaRound(
                                    textStyle: const TextStyle(
                                        color: Colors.white, fontSize: 30.0),
                                  ),
                                ),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
              new Container(
                child: new Container(
                  margin: EdgeInsets.only(top: 50.0),
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditState()),
                      );
                    },
                    color: HexColor("#Eccf3c"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Text(
                      "Edit Profile",
                      style:
                          TextStyle(color: HexColor("#605c5c"), fontSize: 30.0),
                    ),
                  ),
                ),
              ),
              new Container(
                child: new Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 50.0),
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserPage()),
                      );
                    },
                    color: HexColor("#F07788"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Text(
                      "Back",
                      style:
                          TextStyle(color: HexColor("#605c5c"), fontSize: 30.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
