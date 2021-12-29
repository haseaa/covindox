import 'dart:async';
import 'dart:convert';
import 'package:covindox_flutter/user/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:covindox_flutter/main.dart';
import 'package:http/http.dart' as http;

Future<http.Response> registFlutter(
    String username, String email, String pass1, String pass2) {
  return http.post(
    Uri.parse('http://127.0.0.1:8000/register/flutterregist'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'email': email,
      'password1': pass1,
      'password2': pass2,
    }),
  );
}

class Register extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  late String _username, _email, _password, _confirmpass;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromRGBO(144, 228, 252, 10),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 80.0, bottom: 50.0),
                alignment: Alignment.topCenter,
                child: Text("Register",
                    style: GoogleFonts.novaRound(
                      textStyle: TextStyle(color: Colors.white, fontSize: 50.0),
                    )),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      InputText(
                        hintText: "Username",
                        onChanged: (value) => _username = value,
                      ),
                      InputText(
                          hintText: "Email Address",
                          onChanged: (value1) => _email = value1,
                          obscure: false,
                          icon: Icons.email),
                      InputText(
                          hintText: "Password",
                          onChanged: (value2) => _password = value2,
                          obscure: true,
                          icon: Icons.lock),
                      InputText(
                          hintText: "Confirm Password",
                          onChanged: (value3) => _confirmpass = value3,
                          obscure: true,
                          icon: Icons.lock),
                      new Container(
                        margin: EdgeInsets.only(top: 50.0),
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 70),
                          onPressed: () {
                            final form = _formKey.currentState!;
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              if (_password.endsWith(_confirmpass)) {
                                form.save();

                                registFlutter(_username, _email, _password,
                                        _confirmpass)
                                    .then((value) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
                                });

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Processing Data'),
                                    duration: Duration(seconds: 3),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Password Mismatch'),
                                    duration: Duration(seconds: 10),
                                  ),
                                );
                              }
                            }
                          },
                          color: HexColor("#68c8f5"),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Text(
                            "Register",
                            style: TextStyle(
                                color: HexColor("#605c5c"), fontSize: 30.0),
                          ),
                        ),
                      ),
                    ],
                  )),
              new Container(
                margin: EdgeInsets.only(top: 30.0),
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
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
              )
            ],
          ),
        ));
  }
}

class InputText extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final obscure;

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
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
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
