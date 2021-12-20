import 'package:covindox_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';


class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromRGBO(144, 228, 252, 10),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100.0, bottom: 50.0),
              alignment: Alignment.topCenter,
              child: Text("Login",
                  style: GoogleFonts.novaRound(
                    textStyle: TextStyle(color: Colors.white, fontSize: 60.0),
                  )),
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputText(
                      hintText: "Username",
                      onChanged: (value) {},
                    ),
                    InputText(
                        hintText: "Password",
                        onChanged: (value) {},
                        obscure: true,
                        icon: Icons.lock),
                    new Container(
                      margin: EdgeInsets.only(top: 50.0),
                      child: RaisedButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 70),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                        color: HexColor("#68c8f5"),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Text(
                          "Login",
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
                    MaterialPageRoute(builder: (context) => HomePage()),
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
