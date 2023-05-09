import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:lions_flutter/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_remote_config/firebase_remote_config.dart';

const String apiKey = "25222dc25a7a8cb2dc858088c8eb72ccff72ba49f7334047e3d3420fac9a45317c26712e20a5066062328de93c7043b61b3284e837281db08ca60101b76535ada01b4ff99683219441592f9041e0f0d8a84318a91b1eae1aef471654136c3880947ee1e23f3e671831a290444dadb143532d7f44163a015c8bd8c60327986ce7";

set userJWT(String jwt) => LionsPrefs.instance.setString("user_jwt", jwt);
String get userJWT => LionsPrefs.instance.getString("user_jwt") ?? "";

String getEndpoint() => "https://lions.up.railway.app/api";

// String getEndpoint() =>
//     FirebaseRemoteConfig.instance.getString("server_endpoint");

class LionsPrefs {
  static late SharedPreferences instance;

  static Future<void> init() async {
    log("Initialize LionsPrefs...");
    instance = await SharedPreferences.getInstance();
  }
}

class FirebaseAPI {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  static FirebaseStorage storage = FirebaseStorage.instance;

  static Future init() async {
    log("Initialize Firebase...");
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    log("Initialize FirebaseRemoteConfig...");
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));

    log("Fetch FirebaseRemoteConfig...");
    await remoteConfig.fetchAndActivate();
  }
}

class RestPagination<T> {
  String key = "";
  List<T> contents = [];

  set page(int value) {
    if (value < 1) value = 1;
    LionsPrefs.instance.setInt("${key}_page", value);
  }

  int get page {
    int _page = LionsPrefs.instance.getInt("${key}_page") ?? 1;
    if (_page > pageCount) _page = pageCount;
    return _page;
  }

  set pageSize(int value) {
    if (value < 1) value = 1;
    LionsPrefs.instance.setInt("${key}_pageSize", value);
  }

  int get pageSize {
    int _pageSize = LionsPrefs.instance.getInt("${key}_pageSize") ?? 1;
    if (_pageSize > total) _pageSize = total;
    return _pageSize;
  }

  set pageCount(int value) {
    if (value < 1) value = 1;
    LionsPrefs.instance.setInt("${key}_pageCount", value);
  }

  int get pageCount {
    int _pageCount = LionsPrefs.instance.getInt("${key}_pageCount") ?? 1;
    if (_pageCount > total) _pageCount = total;
    return _pageCount;
  }

  set total(int value) {
    if (value < 1) value = 1;
    LionsPrefs.instance.setInt("${key}_total", value);
  }

  int get total {
    int _total = LionsPrefs.instance.getInt("${key}_total") ?? 1;
    if (_total > total) _total = total;
    return _total;
  }

  RestPagination(this.key);
}
