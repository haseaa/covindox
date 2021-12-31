import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'awal.dart';

Future<http.Response> updateArticle(
    String URLimageArtikel,
    String titleArtikel,
    String bagianTitle1,
    String URLimagePendukung1,
    String isiBagian1,
    String URLimagePendukung2,
    String bagianTitle2,
    String isiBagian2) {
  return http.post(
    Uri.parse('https://covindox.herokuapp.com/article/add-article/data-api'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'URLimageArtikel': URLimageArtikel,
      'titleArtikel': titleArtikel,
      'bagianTitle1': bagianTitle1,
      'URLimagePendukung1': URLimagePendukung1,
      'isiBagian1': isiBagian1,
      'URLimagePendukung2': URLimagePendukung2,
      'bagianTitle2': bagianTitle2,
      'isiBagian2': isiBagian2,
    }),
  );
}

class FormArtikel extends StatefulWidget {
  const FormArtikel({Key? key}) : super(key: key);

  @override
  _FormArtikelState createState() => _FormArtikelState();
}

class _FormArtikelState extends State<FormArtikel> {
  String _URLimageArtikel = '';
  String _titleArtikel = '';
  String _bagianTitle1 = '';
  String _URLimagePendukung1 = '';
  String _isiBagian1 = '';
  String _URLimagePendukung2 = '';
  String _bagianTitle2 = '';
  String _isiBagian2 = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget _buildURLimageArtikel() {
    return TextFormField(
        decoration: const InputDecoration(labelText: 'URLimageArtikel'),
        keyboardType: TextInputType.url,
        validator: (value) {
          if (value!.isEmpty) {
            return 'fill this field';
          }
          return null;
        },
        onSaved: (value) {
          _URLimageArtikel = value!;
        });
  }

  Widget _buildURLimagePendukung1() {
    return TextFormField(
        decoration: const InputDecoration(labelText: 'URLimagePendukung1'),
        keyboardType: TextInputType.url,
        validator: (value) {
          if (value!.isEmpty) {
            return 'fill this field';
          }
          return null;
        },
        onSaved: (value) {
          _URLimagePendukung1 = value!;
        });
  }

  Widget _buildURLimagePendukung2() {
    return TextFormField(
        decoration: const InputDecoration(labelText: 'URLimagePendukung2'),
        keyboardType: TextInputType.url,
        validator: (value) {
          if (value!.isEmpty) {
            return 'fill this field';
          }
          return null;
        },
        onSaved: (value) {
          _URLimagePendukung2 = value!;
        });
  }

  Widget _buildTitleArtikel() {
    return TextFormField(
        decoration: const InputDecoration(labelText: 'titleArtikel'),
        keyboardType: TextInputType.url,
        validator: (value) {
          if (value!.isEmpty) {
            return 'fill this field';
          }
          return null;
        },
        onSaved: (value) {
          _titleArtikel = value!;
        });
  }

  Widget _buildBagianTitle1() {
    return TextFormField(
        decoration: const InputDecoration(labelText: 'bagianTitle1'),
        keyboardType: TextInputType.url,
        validator: (value) {
          if (value!.isEmpty) {
            return 'fill this field';
          }
          return null;
        },
        onSaved: (value) {
          _bagianTitle1 = value!;
        });
  }

  Widget _buildBagianTitle2() {
    return TextFormField(
        decoration: const InputDecoration(labelText: 'bagianTitle2'),
        keyboardType: TextInputType.url,
        validator: (value) {
          if (value!.isEmpty) {
            return 'fill this field';
          }
          return null;
        },
        onSaved: (value) {
          _bagianTitle2 = value!;
        });
  }

  Widget _buildIsiBagian1() {
    return TextFormField(
        decoration: const InputDecoration(labelText: 'isiBagian1'),
        keyboardType: TextInputType.url,
        validator: (value) {
          if (value!.isEmpty) {
            return 'fill this field';
          }
          return null;
        },
        onSaved: (value) {
          _isiBagian1 = value!;
        });
  }

  Widget _buildIsiBagian2() {
    return TextFormField(
        decoration: const InputDecoration(labelText: 'isiBagian2'),
        keyboardType: TextInputType.url,
        validator: (value) {
          if (value!.isEmpty) {
            return 'fill this field';
          }
          return null;
        },
        onSaved: (value) {
          _isiBagian2 = value!;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Add Article')),
        backgroundColor: const Color.fromRGBO(144, 228, 252, 10),
        body: SingleChildScrollView(
            child: Container(
          margin: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildURLimageArtikel(),
                _buildTitleArtikel(),
                _buildURLimagePendukung1(),
                _buildBagianTitle1(),
                _buildIsiBagian1(),
                _buildURLimagePendukung2(),
                _buildBagianTitle2(),
                _buildIsiBagian2(),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  child: const Text(
                    'Submit',
                  ),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    _formKey.currentState!.save();

                    updateArticle(
                            _URLimageArtikel,
                            _titleArtikel,
                            _bagianTitle1,
                            _URLimagePendukung1,
                            _isiBagian1,
                            _URLimagePendukung2,
                            _bagianTitle2,
                            _isiBagian2)
                        .then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Awalan()));
                    });
                  },
                )
              ],
            ),
          ),
        )));
  }
}
