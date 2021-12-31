import 'dart:convert';
import 'form.dart';
import 'package:flutter/material.dart';
import 'article_model.dart';
import 'package:http/http.dart' as http;
import 'detail_article.dart';

class Awalan extends StatefulWidget {
  @override
  State<Awalan> createState() => _AwalanState();
}

class _AwalanState extends State<Awalan> {
  final List<Article> _article = <Article>[];

  Future<List<Article>> fetch() async {
    var url = 'https://covindox.herokuapp.com/article/add-article/json';
    var response = await http.get(Uri.parse(url));
    var article = <Article>[];

    if (response.statusCode == 200) {
      var articleJson = json.decode(response.body);

      for (var x in articleJson) {
        article.add(Article.fromJson(x));
      }
    }

    return article;
  }

  @override
  void initState() {
    fetch().then((value) {
      setState(() {
        _article.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(144, 228, 252, 10),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
              color: const Color(0xff2C2E43),
              width: double.infinity,
              height: 400.0,
              child: Column(
                children: const [
                  SizedBox(height: 30),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/read.jpg'),
                    radius: 60,
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Artikel',
                    style: TextStyle(
                      letterSpacing: 2.0,
                      color: Colors.white,
                      height: 1.6,
                      fontFamily: 'Open Sans',
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Di masa pandemi seperti sekarang mungkin banyak yang jenuh dan ingin melakukan suatu kegiatan yang dapat menghilangkan kebosanan, membaca mungkin bisa dijadikan pilihan karena membaca dapat menambah pengetahuan dan mengisi waktu luang.',
                    style: TextStyle(
                      letterSpacing: 2.0,
                      color: Colors.white,
                      height: 1.6,
                      fontFamily: 'Open Sans',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
          const SizedBox(height: 30),
          const Text(
            'Artikel',
            style: TextStyle(
                letterSpacing: 2.0,
                height: 1.6,
                fontFamily: 'Open Sans',
                fontSize: 24),
          ),
          const Divider(
            height: 30,
            color: Colors.black,
          ),
          Column(children: [
            for (var x in _article)
              InkWell(
                child: Text(
                  x.titleArtikel,
                  style: const TextStyle(
                      letterSpacing: 2.0,
                      height: 1.6,
                      fontFamily: 'Open Sans',
                      fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailArticle(ar: x)));
                },
              )
          ]),
          const Divider(
            height: 30,
            color: Colors.black,
          ),
          ElevatedButton(
            child: const Text('Add Article'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FormArtikel()));
            },
          )
        ])));
  }
}
