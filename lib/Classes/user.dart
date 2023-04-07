// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';

import 'package:firebase_auth/firebase_auth.dart';

User? get user => FirebaseAuth.instance.currentUser;
String get uid => user != null ? user!.uid : "1234567890";
UserData currentUserData = UserData();
DocumentReference<UserData> currentUserDataStream = UserData.Converter(uid);

bool isUserSignIn() {
  var currentUser = FirebaseAuth.instance.currentUser;
  return currentUser != null ? true : false;
}

Future<UserData> getUserData() async {
  log("Get UserData: Started...", name: "user.dart");

  if (user != null) {
    var snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    var data = snapshot.data();

    if (data != null) {
      currentUserData = UserData.fromJson(data);
    } else {
      log("Get UserData: User not found...", name: "user.dart");
    }
  } else {
    log("Get UserData: User not logged in...", name: "user.dart");
  }

  log("Get UserData: Ended...", name: "user.dart");

  return currentUserData;
}

class UserDataController {
  static final TextEditingController textController1 = TextEditingController();
  static final TextEditingController textController2 = TextEditingController();
  static final TextEditingController textController3 = TextEditingController();
  static final TextEditingController textController4 = TextEditingController();
  static final TextEditingController textController5 = TextEditingController();
  static final TextEditingController textController6 = TextEditingController();
  static final TextEditingController textController7 = TextEditingController();
  static final TextEditingController textController8 = TextEditingController();
  static final TextEditingController textController9 = TextEditingController();

  static UserData getUserData() {
    UserData data = UserData();

    data.uid = uid;
    if (data.id == "") {
      var bytes = utf8.encode(uid);
      String value = sha256.convert(bytes).toString();
      data.id = value;
    }
    data.user_name = textController1.text;
    data.user_domicile = textController2.text;
    data.user_phone = textController3.text;
    data.user_birthDate = textController4.text;
    data.type_sports = textController5.text;
    data.type_role = textController6.text;
    data.user_about = textController7.text;
    data.social_line = textController8.text;
    data.social_instagram = textController9.text;

    return data;
  }

  static void fromUserData(UserData data) {
    data.uid = uid;
    if (data.id == "") {
      var bytes = utf8.encode(uid);
      String value = sha256.convert(bytes).toString();
      data.id = value;
    }
    textController1.text = data.user_name;
    textController2.text = data.user_domicile;
    textController3.text = data.user_phone;
    textController4.text = data.user_birthDate;
    textController5.text = data.type_sports;
    textController6.text = data.type_role;
    textController7.text = data.user_about;
    textController8.text = data.social_line;
    textController9.text = data.social_instagram;
  }
}

class UserData {
  UserData();

  UserData.fromJson(Map<String, dynamic> json) {
    if (json.containsKey("uid")) uid = json["uid"].toString();
    if (json.containsKey("id")) id = json["id"].toString();

    if (json.containsKey("user_avatar")) {
      user_avatar = UserDataImage.fromJson(json["user_avatar"]);
    }

    if (json.containsKey("user_name")) user_name = json["user_name"].toString();
    if (json.containsKey("user_domicile")) {
      user_domicile = json["user_domicile"].toString();
    }
    if (json.containsKey("user_phone"))
      user_phone = json["user_phone"].toString();
    if (json.containsKey("user_birthDate")) {
      user_birthDate = json["user_birthDate"].toString();
    }
    if (json.containsKey("user_about"))
      user_about = json["user_about"].toString();
    if (json.containsKey("user_email"))
      user_email = json["user_email"].toString();

    if (json.containsKey("social_line"))
      social_line = json["social_line"].toString();
    if (json.containsKey("social_instagram")) {
      social_instagram = json["social_instagram"].toString();
    }

    if (json.containsKey("type_sports"))
      type_sports = json["type_sports"].toString();
    if (json.containsKey("type_role")) type_role = json["type_role"].toString();

    if (json.containsKey("user_achivements")) {
      List<Map<String, dynamic>> map =
          List<Map<String, dynamic>>.from(json["user_achivements"]);

      user_achivements =
          map.map((e) => UserDataAchivement.fromJson(e)).toList();
    }
    if (json.containsKey("user_gallery")) {
      List<Map<String, dynamic>> map =
          List<Map<String, dynamic>>.from(json["user_gallery"]);

      user_gallery = map.map((e) => UserDataImage.fromJson(e)).toList();
    }
  }

  static FirebaseFirestore refFirestore = FirebaseFirestore.instance;
  static FirebaseStorage refStorage = FirebaseStorage.instance;

  String id = "";
  String social_instagram = "";
  String social_line = "";
  String type_role = "";
  String type_sports = "";
  String uid = "";
  String user_about = "";
  List<UserDataAchivement> user_achivements = [];
  UserDataImage user_avatar = UserDataImage();
  String user_birthDate = "";
  String user_domicile = "";
  String user_email = "";
  List<UserDataImage> user_gallery = [];
  String user_name = "";
  String user_phone = "";

  static UserData fromUID(String uid) {
    UserData userData = UserData();
    userData.uid = uid;

    return userData;
  }

  String getUID() {
    return (uid != "") ? uid : "1234567890";
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'id': id,
        'user_avatar': user_avatar.toJson(),
        'user_name': user_name,
        'user_domicile': user_domicile,
        'user_phone': user_phone,
        'user_birthDate': user_birthDate,
        'user_about': user_about,
        'user_email': user_email,
        'social_line': social_line,
        'social_instagram': social_instagram,
        'type_sports': type_sports,
        'type_role': type_role,
        'user_achivements': user_achivements.map((e) => e.toJson()).toList(),
        'user_gallery': user_gallery.map((e) => e.toJson()).toList(),
      };

  DocumentReference<UserData> getConverter() {
    return Converter(getUID());
  }

  static DocumentReference<UserData> Converter(String uid) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .withConverter<UserData>(
          fromFirestore: (snapshot, _) => UserData.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
  }
}

class UserDataImage {
  UserDataImage();

  UserDataImage.fromJson(Map<String, dynamic> json) {
    if (json.containsKey("id")) id = json["id"].toString();
    if (json.containsKey("url")) url = json["url"];
  }

  String id = "";
  String url = "";

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
      };
}

class UserDataAchivement {
  UserDataAchivement();

  UserDataAchivement.fromJson(Map<String, dynamic> json) {
    if (json.containsKey("title")) title = json["title"];
    if (json.containsKey("description")) description = json["description"];
  }

  String description = "";
  String title = "";

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
      };
}
