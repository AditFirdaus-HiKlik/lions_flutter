import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:lions_flutter/Classes/user/user_data.dart';
import 'package:lions_flutter/Data/AppException.dart';
import 'package:lions_flutter/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:lions_flutter/api/network.dart';
import 'package:lions_flutter/api/rest_api.dart';
import 'package:http_parser/http_parser.dart';

import 'package:flutter_image_compress/flutter_image_compress.dart';

class UserManager {
  static String urlMe = "api/users/me";
  static String urlLogin = "api/auth/local";
  static String urlRegister = "api/auth/local/register";

  static bool get isLoggedIn => jwtToken.isEmpty ? false : true;

  // JWT Token Set & Get
  static String get jwtToken => LionsPrefs.instance.getString("jwtToken") ?? "";
  static set jwtToken(String token) =>
      LionsPrefs.instance.setString("jwtToken", token);

  // User Data Json Set & Get
  static String get userDataJson => LionsPrefs.instance.getString("user") ?? "";
  static set userDataJson(String json) =>
      LionsPrefs.instance.setString("user", json);

  // User Data Map Set & Get
  static Map<String, dynamic> get userDataMap => jsonDecode(userDataJson);
  static set userDataMap(Map<String, dynamic> map) =>
      userDataJson = jsonEncode(map);

  // User Data Object Set & Get
  static UserData get userData {
    if (userDataJson.isEmpty) userDataJson = "{}";
    return UserData.fromMap(userDataMap);
  }

  static set userData(UserData userData) => userDataMap = userData.toMap();

  static Future<UserData?> getMe() async {
    String endpoint = getEndpoint();
    endpoint += urlMe;
    endpoint += '?';

    endpoint += "populate=*&";

    if (!(await isConnectedToInternet())) {
      return throw AppException(message: "No internet connection", code: 1);
    }

    if (jwtToken.isEmpty) {
      return throw AppException(message: "No token", code: 2);
    }

    var headers = {
      'Authorization': "Bearer $jwtToken",
    };

    final uri = Uri.parse(endpoint);

    try {
      final response = await RestAPI.get(uri, headers: headers);

      if (response.statusCode == 401) {
        return throw AppException(message: "Unauthorized", code: 2);
      }

      var body = json.decode((response).body);

      if (body['data'] != null) {
        userData = UserData.fromMap(body['data']);
        return userData;
      } else {
        return null;
      }
    } on AppException {
      rethrow;
    } catch (e) {
      return throw AppException(message: "Unknown error", code: 0);
    }
  }

  static Future loadUser() async {
    log("Loading user data");

    UserData data = userData;

    String endpoint = getEndpoint();
    endpoint += "api/users/${data.id}";
    endpoint += '?';

    endpoint += "populate[avatar][populate][0]=image&";
    endpoint += "populate[awards][populate][1]=image&";
    endpoint += "populate[achivements][populate][2]=*&";
    endpoint += "populate[clubs][populate][3]=*&";
    endpoint += "populate[districts][populate][4]=*&";

    var header = {
      'content-type': 'application/json;encoding=utf-8',
      'Authorization': "Bearer ${UserManager.jwtToken}"
    };

    log(endpoint);

    final uri = Uri.parse(endpoint);

    var getResponse = await http.get(uri, headers: header);

    var bodyResponse = json.decode(getResponse.body);

    log("User data: $bodyResponse");

    userDataMap = bodyResponse;
  }

  static Future saveUser() async {
    String endpoint = getEndpoint();
    endpoint += "api/users/${userData.id}";

    var header = {
      'content-type': 'application/json;encoding=utf-8',
    };

    var body = userData.toMap();

    body["avatar"] = userData.avatar.id;

    int awardsIteration = 0;
    body["awards"] = userData.awards
        .map((e) => {
              "title": e.title,
              "body": e.body,
              "__temp_key__": awardsIteration++,
            })
        .toList();

    int achievementsIteration = 0;
    body["achivements"] = userData.achivements
        .map((e) => {
              "title": e.title,
              "body": e.body,
              "__temp_key__": achievementsIteration++,
            })
        .toList();

    var bodyJson = json.encode(body);

    log(bodyJson);

    var bodyText = utf8.encode(bodyJson);

    return await http.put(Uri.parse(endpoint), headers: header, body: bodyText);
  }

  static Future<UserData?> login(String email, String password) async {
    log("login: $email, $password");

    String endpoint = getEndpoint();
    endpoint += urlLogin;

    var body = {
      "identifier": email,
      "password": password,
    };

    final uri = Uri.parse(endpoint);

    final response = http.post(uri, body: body);

    var bodyResponse = json.decode((await response).body);

    if (bodyResponse['jwt'] != null) {
      jwtToken = bodyResponse['jwt'];
      return getMe();
    } else {
      return null;
    }
  }

  static Future<UserData?> register(
      String email, String password, String username) async {
    String endpoint = getEndpoint();
    endpoint += urlRegister;

    var header = {
      'Content-Type': 'multipart/form-data',
    };

    var body = {
      "username": username,
      "email": email,
      "password": password,
    };

    final uri = Uri.parse(endpoint);

    log("Registering user: $body");

    final response = http.post(uri, body: body);

    var bodyResponse = json.decode((await response).body);

    if (bodyResponse['jwt'] != null) {
      jwtToken = bodyResponse['jwt'];
      return getMe();
    } else {
      return null;
    }
  }

  static Future<dynamic> uploadImage(File _image) async {
    var endpoint = getEndpoint();

    endpoint += "api/upload";

    // Authorization
    var header = {
      'Content-Type': 'multipart/form-data',
    };

    var imageBytes = await FlutterImageCompress.compressWithFile(
      _image.absolute.path,
      quality: 50,
      rotate: 0,
    );

    var request = http.MultipartRequest('POST', Uri.parse(endpoint));

    request.headers.addAll(header);

    request.files.add(
      http.MultipartFile.fromBytes(
        'files',
        imageBytes!,
        filename: _image.path.split('/').last,
        contentType: MediaType('image', 'jpeg'),
      ),
    );

    log(endpoint);

    var response = await request.send();

    var responseStream = await response.stream.bytesToString();

    var responseMap = json.decode(responseStream);

    return responseMap;
  }

  static void logout() {
    jwtToken = "";
  }

  static Future deleteUser() async {
    UserData data = userData;

    String endpoint = getEndpoint();
    endpoint += "api/users/${data.id}";

    var header = {'Authorization': "Bearer ${UserManager.jwtToken}"};

    await http.delete(Uri.parse(endpoint), headers: header);

    logout();
  }
}
