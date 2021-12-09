import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'checker.dart';

class ShowResult extends StatelessWidget {
  const ShowResult({Key? key, required this.dataPendaftar}) : super(key: key);
  final DataPendaftar dataPendaftar;

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
            child: Text("Vaccination Booking Data",
                style: GoogleFonts.novaRound(
                  textStyle:
                  const TextStyle(color: Colors.white, fontSize: 50.0),
                )),
          ),

          const Padding(padding: EdgeInsets.only(bottom: 30.0)),

          Card(
            elevation: 8.0,
            margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 6.0),
            child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: Container(
                  padding: const EdgeInsets.only(right: 12.0),
                  decoration: const BoxDecoration(
                      border: Border(
                          right: BorderSide(width: 1.0, color: Colors.white24))),
                  child: const Icon(Icons.date_range_outlined),
                ),
                title: Text(
                  "Tanggal Vaksin: " + dataPendaftar.tanggalVaksin,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0,),
                  textAlign: TextAlign.center,
                ),
            ),
          ),

          Card(
            elevation: 8.0,
            margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 6.0),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: Container(
                padding: const EdgeInsets.only(right: 12.0),
                decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(width: 1.0, color: Colors.white24))),
                child: const Icon(Icons.access_time_outlined),
              ),
              title: Text(
                "Waktu Vaksin: " + dataPendaftar.waktuVaksin,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0,),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Card(
            elevation: 8.0,
            margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 6.0),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: Container(
                padding: const EdgeInsets.only(right: 12.0),
                decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(width: 1.0, color: Colors.white24))),
                child: const Icon(Icons.account_box_outlined),
              ),
              title: Text(
                "NIK: " + dataPendaftar.nik,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0,),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Card(
            elevation: 8.0,
            margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 6.0),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: Container(
                padding: const EdgeInsets.only(right: 12.0),
                decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(width: 1.0, color: Colors.white24))),
                child: const Icon(Icons.account_circle_outlined),
              ),
              title: Text(
                "Nama: " + dataPendaftar.nama,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0,),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Card(
            elevation: 8.0,
            margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 6.0),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: Container(
                padding: const EdgeInsets.only(right: 12.0),
                decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(width: 1.0, color: Colors.white24))),
                child: const Icon(Icons.accessibility_outlined)
              ),
              title: Text(
                "Umur: " + dataPendaftar.usia,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0,),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

}