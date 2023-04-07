import 'dart:convert';

class ImageFormat {
  ImageFormat();

  String ext = "";
  String url = "";
  String hash = "";
  String mime = "";
  String name = "";
  String path = "";
  double size = 0;
  int width = 0;
  int height = 0;

  factory ImageFormat.fromRawJson(String str) =>
      ImageFormat.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImageFormat.fromJson(Map<String, dynamic> json) {
    var imageFormat = ImageFormat();

    imageFormat.ext = json["ext"] ?? imageFormat.ext;
    imageFormat.url = json["url"] ?? imageFormat.url;
    imageFormat.hash = json["hash"] ?? imageFormat.hash;
    imageFormat.mime = json["mime"] ?? imageFormat.mime;
    imageFormat.name = json["name"] ?? imageFormat.name;
    imageFormat.path = json["path"] ?? imageFormat.path;
    imageFormat.size = json["size"] ?? imageFormat.size;
    imageFormat.width = json["width"] ?? imageFormat.width;
    imageFormat.height = json["height"] ?? imageFormat.height;

    return imageFormat;
  }

  Map<String, dynamic> toJson() => {
        "ext": ext,
        "url": url,
        "hash": hash,
        "mime": mime,
        "name": name,
        "path": path,
        "size": size,
        "width": width,
        "height": height,
      };
}
