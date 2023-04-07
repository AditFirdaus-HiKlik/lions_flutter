import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:lions_flutter/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_remote_config/firebase_remote_config.dart';

String getEndpoint() =>
    FirebaseRemoteConfig.instance.getString("server_endpoint");

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
