import 'dart:convert';

import 'package:lions_flutter/Data/ImageFormat/ImageFormat.dart';

class ImageFormats {
  ImageFormats();

  ImageFormat small = ImageFormat();
  ImageFormat medium = ImageFormat();
  ImageFormat large = ImageFormat();
  ImageFormat thumbnail = ImageFormat();

  factory ImageFormats.fromRawJson(String str) =>
      ImageFormats.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImageFormats.fromJson(Map<String, dynamic> json) {
    var imageFormats = ImageFormats();

    imageFormats.small = json["small"] != null
        ? ImageFormat.fromJson(json["small"])
        : imageFormats.small;

    imageFormats.medium = json["medium"] != null
        ? ImageFormat.fromJson(json["medium"])
        : imageFormats.medium;

    imageFormats.large = json["large"] != null
        ? ImageFormat.fromJson(json["large"])
        : imageFormats.large;

    imageFormats.thumbnail = json["thumbnail"] != null
        ? ImageFormat.fromJson(json["thumbnail"])
        : imageFormats.thumbnail;

    return imageFormats;
  }

  Map<String, dynamic> toJson() => {
        "small": small.toJson(),
        "medium": medium.toJson(),
        "large": large.toJson(),
        "thumbnail": thumbnail.toJson(),
      };
}
