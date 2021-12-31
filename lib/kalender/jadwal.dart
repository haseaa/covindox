import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'entities/event.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:covindox_flutter/registervaccine/checker.dart';

class JadwalApp extends StatelessWidget {
  const JadwalApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const JadwalPage(title: 'Pilih Tanggal Vaksin'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class JadwalPage extends StatefulWidget {
  const JadwalPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<JadwalPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<JadwalPage> {
  List<Event> _events = [];

  Future<List<Event>> fetchEvent() async {
    var url = 'https://covindox.herokuapp.com/registrasi/json';
    var response = await http.get(Uri.parse(url));

    List<Event> events = [];

    if (response.statusCode == 200) {
      var eventsJson = jsonDecode(response.body);
      for (var eventJson in eventsJson) {
        events.add(Event.fromJson(eventJson));
      }
    }
    return events;
  }

  String dateFormatter(String date) {
    var year = date.substring(0, 4);
    var month = date.substring(5, 7);
    var day = date.substring(8, 10);

    switch (month) {
      case '01':
        {
          month = 'Januari';
        }
        break;

      case '02':
        {
          month = 'Februari';
        }
        break;

      case '03':
        {
          month = 'Maret';
        }
        break;

      case '04':
        {
          month = 'April';
        }
        break;

      case '05':
        {
          month = 'Mei';
        }
        break;

      case '06':
        {
          month = 'Juni';
        }
        break;

      case '07':
        {
          month = 'Juli';
        }
        break;

      case '08':
        {
          month = 'Agustus';
        }
        break;

      case '09':
        {
          month = 'September';
        }
        break;

      case '10':
        {
          month = 'Oktober';
        }
        break;

      case '11':
        {
          month = 'November';
        }
        break;

      case '12':
        {
          month = 'Desember';
        }
        break;
    }

    return day + ' ' + month + ' ' + year;
  }

  @override
  void initState() {
    fetchEvent().then((value) {
      setState(() {
        _events.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(144, 228, 252, 10),
      appBar: AppBar(
        title: Text(
          'Pilih Jadwal Vaksin',
          style: GoogleFonts.novaRound(
              textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Checker(
                            tanggal_vaksin: dateFormatter(_events[index].date),
                            waktu_vaksin:
                                _events[index].start_time.substring(0, 5) +
                                    ' - ' +
                                    _events[index].end_time.substring(0, 5),
                            event: _events[index].pk.toString(),
                          )));
            },
            child: Card(
                margin: EdgeInsets.fromLTRB(40, 5, 40, 5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                color: Color.fromRGBO(208, 118, 33, 5),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      Text(
                        _events[index].title,
                        style: GoogleFonts.novaRound(
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      Text(
                        dateFormatter(_events[index].date),
                        style: GoogleFonts.novaRound(
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      Text(
                        _events[index].start_time.substring(0, 5) +
                            ' - ' +
                            _events[index].end_time.substring(0, 5),
                        style: GoogleFonts.novaRound(
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                )),
          );
        },
        itemCount: _events.length,
      ),
    );
  }
}
