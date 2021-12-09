import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'checker.dart';

class VaccineForm extends StatelessWidget {
  VaccineForm(
      {Key? key,
      required this.tanggal_vaksin,
      required this.waktu_vaksin,
      required this.event})
      : super(key: key);

  final _vaccineFormKey = GlobalKey<FormState>();

  final String tanggal_vaksin;
  final String waktu_vaksin;
  final String event;
  final FocusNode _unameFocusNode = FocusNode();
  final FocusNode _eventFocusNode = FocusNode();
  final FocusNode _tglFocusNode = FocusNode();
  final FocusNode _waktuFocusNode = FocusNode();
  final FocusNode _nikFocusNode = FocusNode();
  final FocusNode _namaFocusNode = FocusNode();
  final FocusNode _umurFokusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    _nextFocus(FocusNode focusNode) {
      FocusScope.of(context).requestFocus(focusNode);
    }

    _book() {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Registration Sent')));
    }

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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0)),
              child: Form(
                  key: _vaccineFormKey,
                  child: Column(children: <Widget>[
                    TextFormField(
                      initialValue: "admin",
                      enabled: false,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      focusNode: _unameFocusNode,
                      onFieldSubmitted: (String value) {
                        // Do something with the value
                        _nextFocus(_eventFocusNode);
                      },
                      style: const TextStyle(
                        fontSize: 25.0,
                      ),
                      decoration: const InputDecoration(
                          border: InputBorder.none, labelText: 'Username'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 30.0),
                    ),
                    TextFormField(
                      initialValue: event,
                      enabled: false,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      focusNode: _eventFocusNode,
                      onFieldSubmitted: (String value) {
                        // Do something with the value
                        _nextFocus(_tglFocusNode);
                      },
                      style: const TextStyle(
                        fontSize: 25.0,
                      ),
                      decoration: const InputDecoration(
                          border: InputBorder.none, labelText: 'Event '),
                    ),
                    TextFormField(
                      initialValue: tanggal_vaksin,
                      enabled: false,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      focusNode: _tglFocusNode,
                      onFieldSubmitted: (String value) {
                        // Do something with the value
                        _nextFocus(_waktuFocusNode);
                      },
                      style: const TextStyle(
                        fontSize: 25.0,
                      ),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.date_range_outlined),
                          border: InputBorder.none,
                          hintText: 'yyyy-mm-dd',
                          labelText: 'Vaccination Date'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 30.0),
                    ),
                    TextFormField(
                      initialValue: waktu_vaksin,
                      enabled: false,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      focusNode: _waktuFocusNode,
                      onFieldSubmitted: (String value) {
                        // Do something with the value
                        _nextFocus(_nikFocusNode);
                      },
                      style: const TextStyle(
                        fontSize: 25.0,
                      ),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.access_time_outlined),
                          border: InputBorder.none,
                          hintText: '00:00 - 01:00',
                          labelText: 'Vaccination Time'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 30.0),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      focusNode: _nikFocusNode,
                      onFieldSubmitted: (String value) {
                        // Do something with the value
                        _nextFocus(_namaFocusNode);
                      },
                      style: const TextStyle(
                        fontSize: 25.0,
                      ),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.account_box_outlined),
                          border: InputBorder.none,
                          hintText: 'Enter Your NIK',
                          labelText: 'NIK'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 30.0),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      focusNode: _namaFocusNode,
                      onFieldSubmitted: (String value) {
                        // Do something with the value
                        _nextFocus(_umurFokusNode);
                      },
                      style: const TextStyle(
                        fontSize: 25.0,
                      ),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.account_circle_outlined),
                          border: InputBorder.none,
                          hintText: 'Enter Your Full Name',
                          labelText: 'Full Name'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 30.0),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      focusNode: _umurFokusNode,
                      onFieldSubmitted: (String value) {
                        // Do something with the value
                        _book();
                      },
                      style: const TextStyle(
                        fontSize: 25.0,
                      ),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.accessibility_outlined),
                          border: InputBorder.none,
                          hintText: 'Enter Your Age',
                          labelText: 'Age'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 30.0),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Checker(
                                      tanggal_vaksin: "08-12-2021",
                                      waktu_vaksin: "09:04 - 10:04",
                                      event: "1")));
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(fontSize: 25.0),
                        )),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 30.0),
                    ),
                  ])),
            )
          ],
        ));
  }
}
