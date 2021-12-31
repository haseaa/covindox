import 'article_model.dart';
import 'package:flutter/material.dart';

class DetailArticle extends StatelessWidget {
  final Article ar;
  const DetailArticle({Key? key, required this.ar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(144, 228, 252, 10),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: NetworkImage(ar.URLimageArtikel),
              height: 200,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              ar.titleArtikel,
              style: const TextStyle(
                  letterSpacing: 2.0,
                  height: 1.6,
                  fontFamily: 'Open Sans',
                  fontSize: 22),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              ar.bagianTitle1,
              style: const TextStyle(
                  letterSpacing: 2.0,
                  height: 1.6,
                  fontFamily: 'Open Sans',
                  fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            Image(
                image: NetworkImage(ar.URLimagePendukung1),
                height: 200,
                width: double.infinity,
                fit: BoxFit.fill),
            const SizedBox(
              height: 30,
            ),
            Text(
              ar.isiBagian1,
              style: const TextStyle(
                  letterSpacing: 1.0,
                  height: 1.6,
                  fontFamily: 'Open Sans',
                  fontSize: 12),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              ar.bagianTitle2,
              style: const TextStyle(
                  letterSpacing: 2.0,
                  height: 1.6,
                  fontFamily: 'Open Sans',
                  fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            Image(
                image: NetworkImage(ar.URLimagePendukung2),
                height: 200,
                width: double.infinity,
                fit: BoxFit.fill),
            const SizedBox(
              height: 30,
            ),
            Text(
              ar.isiBagian2,
              style: const TextStyle(
                  letterSpacing: 1.0,
                  height: 1.6,
                  fontFamily: 'Open Sans',
                  fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
