import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Inspired from https://github.com/theflutterfactory/Flutter-Tutorials/blob/form_demo/lib/form_screen.dart

String userName = '';
String tanggalVaksin = '';
String waktuVaksin = '';
String event = '';

Future<http.Response> updateDataPendaftar(
    String username,
    String event,
    String tanggal_vaksin,
    String waktu_vaksin,
    String nik,
    String nama,
    String usia) {
  return http.post(
    Uri.parse('https://covindox.herokuapp.com/registervaccine/dataapi'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'event': event,
      'tanggal_vaksin': tanggal_vaksin,
      'waktu_vaksin': waktu_vaksin,
      'nik': nik,
      'nama': nama,
      'usia': usia,
    }),
  );
}

class FormVaksin extends StatefulWidget {
  var user_name;
  var waktu_vaksin;
  var tanggal_vaksin;
  var event_app;

  FormVaksin(
      {Key? key,
      required this.user_name,
      required this.tanggal_vaksin,
      required this.waktu_vaksin,
      required this.event_app})
      : super(key: key) {
    userName = user_name;
    tanggalVaksin = tanggal_vaksin;
    waktuVaksin = waktu_vaksin;
    event = event_app;
  }

  @override
  State<StatefulWidget> createState() {
    return FormVaksinState();
  }
}

class FormVaksinState extends State<FormVaksin> {
  String _username = userName;
  String _event = event;
  String _tanggal_vaksin = tanggalVaksin;
  String _waktu_vaksin = waktuVaksin;
  String _nik = '';
  String _nama = '';
  String _usia = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildUserName() {
    return TextFormField(
      initialValue: _username,
      enabled: false,
      style: const TextStyle(
        fontSize: 25.0,
      ),
      decoration: const InputDecoration(
          border: InputBorder.none, labelText: 'Username'),
    );
  }

  Widget _buildTanggalVaksin() {
    return TextFormField(
      initialValue: _tanggal_vaksin,
      enabled: false,
      style: const TextStyle(
        fontSize: 25.0,
      ),
      decoration: const InputDecoration(
          border: InputBorder.none, labelText: 'Tanggal Vaksin'),
    );
  }

  Widget _buildWaktuVaksin() {
    return TextFormField(
      initialValue: _waktu_vaksin,
      enabled: false,
      style: const TextStyle(
        fontSize: 25.0,
      ),
      decoration: const InputDecoration(
          border: InputBorder.none, labelText: 'Waktu Vaksin'),
    );
  }

  Widget _buildNIK() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value!.isEmpty) {
          return 'NIK is required';
        }
        return null;
      },
      onSaved: (value) {
        _nik = value!;
      },
      style: const TextStyle(
        fontSize: 25.0,
      ),
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.account_box_outlined),
          border: InputBorder.none,
          hintText: 'Enter Your NIK',
          labelText: 'NIK'),
    );
  }

  Widget _buildNama() {
    return TextFormField(
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Full Name is required';
        }
        return null;
      },
      onSaved: (value) {
        _nama = value!;
      },
      style: const TextStyle(
        fontSize: 25.0,
      ),
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.account_circle_outlined),
          border: InputBorder.none,
          hintText: 'Enter Your Full Name',
          labelText: 'Full Name'),
    );
  }

  Widget _buildUsia() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Age is Required';
        }
        return null;
      },
      onSaved: (value) {
        _usia = value!;
      },
      style: const TextStyle(
        fontSize: 25.0,
      ),
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.accessibility_outlined),
          border: InputBorder.none,
          hintText: 'Enter Your Age',
          labelText: 'Age'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(144, 228, 252, 10),
        body: ListView(
            padding: const EdgeInsets.only(
                top: 80.0, bottom: 20.0, left: 30.0, right: 30.0),
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                child: Text("Book a Vaccine now!",
                    style: GoogleFonts.novaRound(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 50.0),
                    )),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 30.0)),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Form(
                      key: _formKey,
                      child: Column(children: <Widget>[
                        _buildUserName(),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 30.0),
                        ),
                        _buildTanggalVaksin(),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 30.0),
                        ),
                        _buildWaktuVaksin(),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 30.0),
                        ),
                        _buildNIK(),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 30.0),
                        ),
                        _buildNama(),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 30.0),
                        ),
                        _buildUsia(),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 30.0),
                        ),
                        ElevatedButton(
                          child: const Text(
                            'Submit',
                            style: TextStyle(fontSize: 25.0),
                          ),
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }

                            _formKey.currentState!.save();

                            updateDataPendaftar(
                                    _username,
                                    _event,
                                    _tanggal_vaksin,
                                    _waktu_vaksin,
                                    _nik,
                                    _nama,
                                    _usia)
                                .then((value) {
                              Navigator.pop(context);
                            });
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 30.0),
                        ),
                      ])))
            ]));
  }
}
