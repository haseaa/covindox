import 'dart:convert';

import 'package:covindox_flutter/auth_user.dart';
import 'package:covindox_flutter/main.dart';
import 'package:covindox_flutter/session_main.dart';
import 'package:covindox_flutter/user/userprofile.dart';
import 'package:covindox_flutter/user_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

Future<http.Response> editUserProfile(
    String fullname, String phone, String address) {
  return http.post(
    Uri.parse('http://127.0.0.1:8000/profile/edit-profile/flutter'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, String>{
      'fullname': fullname,
      'phone': phone,
      'address': address,
    }),
  );
}

class EditState extends StatefulWidget {
  const EditState({Key? key}) : super(key: key);

  @override
  EditProfile createState() => EditProfile();
}

class EditProfile extends State<EditState> {
  final _formKey = GlobalKey<FormState>();
  late String fullname, phone, address;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        backgroundColor: const Color.fromRGBO(144, 228, 252, 10),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100.0, bottom: 50.0),
              alignment: Alignment.topCenter,
              child: Text("Editing Profile",
                  style: GoogleFonts.novaRound(
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 60.0),
                  )),
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputText(
                      hintText: "Fullname",
                      onChanged: (value) => fullname = value,
                    ),
                    InputText(
                        hintText: "Phone",
                        onChanged: (value2) => phone = value2,
                        icon: Icons.local_phone),
                    InputText(
                        hintText: "Address",
                        onChanged: (value3) => address = value3,
                        icon: Icons.location_on),
                    Container(
                      margin: EdgeInsets.only(top: 50.0),
                      child: RaisedButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 70),
                        onPressed: () async {
                          final form = _formKey.currentState!;
                          if (form.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database
                            form.save();
                            final request = Provider.of<CookieRequest>(context,
                                listen: false);
                            request
                                .post(
                                    'http://127.0.0.1:8000/profile/edit-profile/flutter',
                                    jsonEncode(<String, String>{
                                      'fullname': fullname,
                                      'no_phone': phone,
                                      'address': address
                                    }))
                                .then((value) => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Profile()),
                                    ));
                          }
                        },
                        color: HexColor("#68c8f5"),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Text(
                          "Save",
                          style: TextStyle(
                              color: HexColor("#605c5c"), fontSize: 30.0),
                        ),
                      ),
                    ),
                  ],
                )),
            new Container(
              margin: EdgeInsets.only(top: 50.0),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
                color: HexColor("#F07788"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Text(
                  "Back",
                  style: TextStyle(color: HexColor("#605c5c"), fontSize: 30.0),
                ),
              ),
            )
          ],
        ));
  }
}

class InputText extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final obscure;
  var answer;

  InputText({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
    this.obscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      width: 350.0,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(60)),
      child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Do not leave it empty';
            }
            return null;
          },
          obscureText: obscure,
          onChanged: onChanged,
          style: TextStyle(color: Colors.white, fontSize: 25.0),
          decoration: InputDecoration(
              icon: Icon(icon, color: Colors.white),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none)),
    );
  }
}
