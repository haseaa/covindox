class Article {
  final String URLimageArtikel;
  final String titleArtikel;
  final String bagianTitle1;
  final String URLimagePendukung1;
  final String isiBagian1;
  final String URLimagePendukung2;
  final String bagianTitle2;
  final String isiBagian2;

  Article({
    required this.URLimageArtikel,
    required this.titleArtikel,
    required this.bagianTitle1,
    required this.URLimagePendukung1,
    required this.isiBagian1,
    required this.URLimagePendukung2,
    required this.bagianTitle2,
    required this.isiBagian2,
  });

  factory Article.fromJson(Map<String, dynamic> js) {
    Map<String, dynamic> json = js['fields'];
    return Article(
      URLimageArtikel: json['URLimageArtikel'],
      titleArtikel: json['titleArtikel'],
      bagianTitle1: json['bagianTitle1'],
      URLimagePendukung1: json['URLimagePendukung1'],
      isiBagian1: json['isiBagian1'],
      URLimagePendukung2: json['URLimagePendukung2'],
      bagianTitle2: json['bagianTitle2'],
      isiBagian2: json['isiBagian2'],
    );
  }
}
