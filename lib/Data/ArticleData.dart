// To parse this JSON data, do
//
//     final articleData = articleDataFromJson(jsonString);

import 'package:lions_flutter/Classes/user/user_data.dart';

class ArticleData {
  int id = 0;
  ArticleAttributes attributes = ArticleAttributes();

  ArticleData({
    id,
    attributes,
  });

  ArticleData.fromMap(Map<String, dynamic> json) {
    id = json["id"];
    attributes = ArticleAttributes.fromMap(json["attributes"]);
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes.toMap(),
      };
}

class ArticleAttributes {
  String title = "";
  String url = "";
  String author = "";
  String body = "";
  String citation = "";
  SingleImage coverImage = SingleImage();

  ArticleAttributes({
    title,
    url,
    author,
    body,
    citation,
    coverImage,
  });

  ArticleAttributes.fromMap(Map<String, dynamic> json) {
    title = json["title"] ?? "";
    url = json["url"] ?? "";
    author = json["author"] ?? "";
    body = json["body"] ?? "";
    citation = json["citation"] ?? "";
    coverImage =
        SingleImage.fromMap(json["coverImage"]?["data"]?["attributes"] ?? {});
  }

  Map<String, dynamic> toMap() => {
        "title": title,
        "url": url,
        "author": author,
        "body": body,
        "citation": citation,
        "coverImage": coverImage.toMap(),
      };
}
