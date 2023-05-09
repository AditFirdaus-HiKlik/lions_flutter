// To parse this JSON data, do
//
//     final UserData = UserDataFromMap(jsonString);

import 'dart:developer';

import 'package:lions_flutter/models/single_image/single_image.dart';

class UserData {
  int id = 0;
  String username = "";
  String email = "";
  String provider = "";
  bool confirmed = false;
  bool blocked = false;
  SingleImage avatar = SingleImage();
  DateTime birthDate = DateTime.now();
  String phone = "";
  String name = "";
  String about = "";
  String address = "";
  UserDistrict district = UserDistrict();
  String club = "";
  List<UserAward> awards = [];
  List<UserAchivement> achivements = [];
  UserSocial social = UserSocial();

  UserData({
    id,
    username,
    email,
    provider,
    confirmed,
    blocked,
    avatar,
    birthDate,
    phone,
    name,
    about,
    address,
    district,
    club,
    awards,
    achivements,
    social,
  }) {
    this.id = id ?? 0;
    this.username = username ?? "";
    this.email = email ?? "";
    this.provider = provider ?? "";
    this.confirmed = confirmed ?? false;
    this.blocked = blocked ?? false;
    this.avatar = avatar ?? SingleImage();
    this.birthDate = birthDate ?? DateTime.now();
    this.phone = phone ?? "";
    this.name = name ?? "";
    this.about = about ?? "";
    this.address = address ?? "";
    this.district = district ?? UserDistrict();
    this.club = club ?? "";
    this.awards = awards ?? [];
    this.achivements = achivements ?? [];
    this.social = social ?? UserSocial();
  }

  factory UserData.fromMap(Map<String, dynamic> json) {
    return UserData(
      id: json["id"] ?? 0,
      username: json["username"] ?? "",
      email: json["email"] ?? "",
      provider: json["provider"] ?? "",
      confirmed: json["confirmed"] ?? false,
      blocked: json["blocked"] ?? false,
      avatar: SingleImage.fromJson(json["avatar"] ?? {}),
      birthDate: DateTime.parse(json["birthDate"] ?? DateTime.now().toString()),
      phone: json["phone"] ?? "",
      name: json["name"] ?? "",
      about: json["about"] ?? "",
      address: json["address"] ?? "",
      district: UserDistrict.fromMap(json["district"] ?? {}),
      club: json["club"] ?? "",
      awards: List<UserAward>.from(
          (json["awards"] ?? []).map((x) => UserAward.fromMap(x))),
      achivements: List<UserAchivement>.from(
          (json["achivements"] ?? []).map((x) => UserAchivement.fromMap(x))),
      social: UserSocial.fromMap(json["social"] ?? {}),
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "email": email,
        "provider": provider,
        "confirmed": confirmed,
        "blocked": blocked,
        "avatar": avatar.toJson(),
        "birthDate": birthDate.toIso8601String(),
        "phone": phone,
        "name": name,
        "about": about,
        "address": address,
        "district": district.toMap(),
        "club": club,
        "awards": List<dynamic>.from(awards.map((x) => x.toMap())),
        "achivements": List<dynamic>.from(achivements.map((x) => x.toMap())),
        "social": social.toMap(),
      };

  UserData copyWith({
    int? id,
    String? username,
    String? email,
    String? provider,
    bool? confirmed,
    bool? blocked,
    SingleImage? avatar,
    DateTime? birthDate,
    String? phone,
    String? name,
    String? about,
    String? address,
    List<UserDistrict>? district,
    String? club,
    List<UserAward>? awards,
    List<UserAchivement>? achivements,
    UserSocial? social,
  }) =>
      UserData(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        provider: provider ?? this.provider,
        confirmed: confirmed ?? this.confirmed,
        blocked: blocked ?? this.blocked,
        avatar: avatar ?? this.avatar,
        birthDate: birthDate ?? this.birthDate,
        phone: phone ?? this.phone,
        name: name ?? this.name,
        about: about ?? this.about,
        address: address ?? this.address,
        district: district ?? this.district,
        club: club ?? this.club,
        awards: awards ?? this.awards,
        achivements: achivements ?? this.achivements,
        social: social ?? this.social,
      );
}

class UserAchivement {
  int id = 0;
  String title = "";
  String body = "";

  UserAchivement({
    id,
    title,
    body,
  }) {
    this.id = id ?? 0;
    this.title = title ?? "";
    this.body = body ?? "";
  }

  factory UserAchivement.fromMap(Map<String, dynamic> json) => UserAchivement(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        body: json["body"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "body": body,
      };
}

class UserAward {
  int id = 0;
  String title = "";
  String body = "";

  UserAward({
    id,
    title,
    body,
  }) {
    this.id = id ?? 0;
    this.title = title ?? "";
    this.body = body ?? "";
  }

  factory UserAward.fromMap(Map<String, dynamic> json) => UserAward(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        body: json["body"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "body": body,
      };
}

class ImageFormats {
  ImageFormat large = ImageFormat();
  ImageFormat small = ImageFormat();
  ImageFormat medium = ImageFormat();
  ImageFormat thumbnail = ImageFormat();

  ImageFormats({
    large,
    small,
    medium,
    thumbnail,
  }) {
    this.large = large ?? ImageFormat();
    this.small = small ?? ImageFormat();
    this.medium = medium ?? ImageFormat();
    this.thumbnail = thumbnail ?? ImageFormat();
  }

  factory ImageFormats.fromMap(Map<String, dynamic> json) => ImageFormats(
        large: ImageFormat.fromMap(json["large"] ?? {}),
        small: ImageFormat.fromMap(json["small"] ?? {}),
        medium: ImageFormat.fromMap(json["medium"] ?? {}),
        thumbnail: ImageFormat.fromMap(json["thumbnail"] ?? {}),
      );

  Map<String, dynamic> toMap() => {
        "large": large.toMap(),
        "small": small.toMap(),
        "medium": medium.toMap(),
        "thumbnail": thumbnail.toMap(),
      };
}

class ImageFormat {
  String ext = "";
  String url = "";
  String hash = "";
  String path = "";
  double size = 0;
  int width = 0;
  int height = 0;

  ImageFormat({
    ext,
    url,
    hash,
    path,
    size,
    width,
    height,
  }) {
    this.ext = ext ?? "";
    this.url = url ?? "";
    this.hash = hash ?? "";
    this.path = path ?? "";
    this.width = width ?? 0;
    this.height = height ?? 0;
  }

  factory ImageFormat.fromMap(Map<String, dynamic> json) => ImageFormat(
        ext: json["ext"] ?? "",
        url: json["url"] ?? "",
        hash: json["hash"] ?? "",
        path: json["path"] ?? "",
        size: json["size"] ?? 0,
        width: json["width"] ?? 0,
        height: json["height"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "ext": ext,
        "url": url,
        "hash": hash,
        "path": path,
        "size": size,
        "width": width,
        "height": height,
      };
}

class UserDistrict {
  int id = 0;
  String title = "";

  UserDistrict({
    id,
    title,
  }) {
    this.id = id ?? 0;
    this.title = title ?? "";
  }

  factory UserDistrict.fromMap(Map<String, dynamic> json) => UserDistrict(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
      };
}

class UserSocial {
  String instagram = "";

  UserSocial({
    instagram,
  }) {
    this.instagram = instagram ?? "";
  }

  factory UserSocial.fromMap(Map<String, dynamic> json) => UserSocial(
        instagram: json["instagram"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "instagram": instagram,
      };
}
