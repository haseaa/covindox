import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'form.dart';
import 'showresult.dart';

class DataPendaftar {
  final String tanggalVaksin;
  final String waktuVaksin;
  final String nama;
  final String nik;
  final String usia;

  DataPendaftar({
    required this.tanggalVaksin,
    required this.waktuVaksin,
    required this.nama,
    required this.nik,
    required this.usia,
  });

  factory DataPendaftar.fromJson(Map<String, dynamic> json) {
    return DataPendaftar(
      tanggalVaksin: json['tanggal_vaksin'],
      waktuVaksin: json['waktu_vaksin'],
      nama: json['nama'],
      nik: json['nik'],
      usia: json['umur'],
    );
  }
}

Future<DataPendaftar> fetchData() async {
  // Hard Coded
  String username = 'admin';
  final response = await http.post(Uri.parse(
      'https://covindox.herokuapp.com/registervaccine/datapendaftarapi/' +
          username));

  print(response.statusCode);
  if (response.statusCode == 200) {
    // Kalau statusnya 200, berarti berhasil
    return DataPendaftar.fromJson(jsonDecode(response.body));
  } else {
    // Kalau gagal, balikin aja objeknya dengan atribut String kosong
    return DataPendaftar(
        usia: '', nik: '', waktuVaksin: '', tanggalVaksin: '', nama: '');
  }
}

class Checker extends StatelessWidget {
  const Checker(
      {Key? key,
      required this.tanggal_vaksin,
      required this.waktu_vaksin,
      required this.event})
      : super(key: key);

  final String tanggal_vaksin;
  final String waktu_vaksin;
  final String event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(144, 228, 252, 10),
        body: FutureBuilder<DataPendaftar>(
          future: fetchData(),
          builder: (context, snapshot) {
            final dataPendaftar = snapshot.data;

            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    CircularProgressIndicator(),
                    Text(
                      'Loading data from the server',
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ],
                ));
              default:
                if (dataPendaftar != null) {
                  if (dataPendaftar.tanggalVaksin == '') {
                    return FormVaksin(
                        tanggal_vaksin: tanggal_vaksin,
                        waktu_vaksin: waktu_vaksin,
                        event_app: event);
                  } else {
                    return ShowResult(
                      dataPendaftar: dataPendaftar,
                    );
                  }
                }
                return const SizedBox();
            }
          },
        ));
  }
}
