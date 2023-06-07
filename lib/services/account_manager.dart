import 'dart:convert';
import 'dart:developer';

import 'package:lions_flutter/api/api.dart';
import 'package:lions_flutter/models/account/account.dart';
import 'package:http/http.dart' as http;

class AccountManager {
  static String get jwt => LionsPrefs.instance.getString("jwtToken") ?? "";
  static set jwt(String token) =>
      LionsPrefs.instance.setString("jwtToken", token);

  static get isLoggedIn => jwt != "";

  static Account get account => getLocalAccount();
  static set account(Account account) => setLocalAccount(account);

  static Future setAccount(Account account) async {
    String endpoint = "$apiEndpoint/users/${account.id}";

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $jwt"
    };

    log(endpoint);

    Map<String, dynamic> body = encodeAccount(account);

    String bodyString = jsonEncode(body);

    log(bodyString);

    await http.put(Uri.parse(endpoint), headers: headers, body: bodyString);
  }

  static Future<Account> getAccount() async {
    String endpoint = "$apiEndpoint/users/me?";

    Map<String, String> parameters = {
      'populate': '*',
      'populate[0]': 'avatar',
      'populate[1]': 'phone',
      'populate[2]': 'district',
      'populate[3]': 'club',
      'populate[4]': 'awards',
      'populate[5]': 'achivements',
      'populate[6]': 'social',
      'populate[7]': 'trainings',
    };

    endpoint += Uri(queryParameters: parameters).query;

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $jwt"
    };

    var result = await http.get(Uri.parse(endpoint), headers: headers);

    if (result.statusCode == 200) {
      Map<String, dynamic> accountMap = jsonDecode(result.body);
      Account account = decodeAccount(accountMap);
      return account;
    } else {
      throw Exception("Failed to load account");
    }
  }

  static Account getLocalAccount() {
    String accountString = LionsPrefs.instance.getString("account") ?? "";
    Map<String, dynamic> accountMap = jsonDecode(accountString);
    Account account = Account.fromJson(accountMap);

    return account;
  }

  static void setLocalAccount(Account account) {
    Map<String, dynamic> accountMap = account.toJson();

    String json = jsonEncode(accountMap);

    LionsPrefs.instance.setString("account", json);
  }

  static Future<http.Response> login(String identifier, String password,
      {Function? onSuccess, Function(String)? onFailed}) async {
    String endpoint = "$apiEndpoint/auth/local";

    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    log(endpoint);

    Map<String, String> body = {};

    body["identifier"] = identifier;
    body["password"] = password;

    String json = jsonEncode(body);

    var result =
        await http.post(Uri.parse(endpoint), body: json, headers: headers);

    var responseJson = jsonDecode(result.body);

    if (result.statusCode == 200) {
      AccountManager.jwt = responseJson["jwt"];

      account = decodeAccount(responseJson["user"]);

      onSuccess?.call(account);
    } else {
      String message = "Unknown Error";

      if (responseJson["error"]) {
        if (responseJson["error"]["message"] != null) {
          message = responseJson["error"]["message"];
        }
      }

      onFailed?.call(message);
    }

    return result;
  }

  static Future<http.Response> register(
      String identifier, String email, String password,
      {Map<String, dynamic>? fields,
      Function(Account)? onSuccess,
      Function(String)? onFailed}) async {
    String endpoint = "$apiEndpoint/auth/local/register";

    Map<String, String> headers = {"Content-Type": "application/json"};

    Map<String, String> body = {};

    body["identifier"] = identifier;
    body["email"] = email;
    body["password"] = password;

    if (fields != null) {
      fields.forEach((key, value) {
        body[key] = value.toString();
      });
    }

    String bodyJson = jsonEncode(body);

    var result =
        await http.post(Uri.parse(endpoint), body: bodyJson, headers: headers);

    if (result.statusCode == 200) {
      var body = jsonDecode(result.body);
      AccountManager.jwt = body[["jwt"]];

      account = decodeAccount(body[["user"]]);

      onSuccess?.call(account);
    } else {
      var body = jsonDecode(result.body);

      String message = "Unknown Error";

      if (body["error"]) {
        if (body["error"]["message"] != null) {
          message = body["error"]["message"];
        }
      }

      onFailed?.call(message);
    }

    return result;
  }

  static Future logout() async {
    jwt = "";
    await Future.delayed(const Duration(seconds: 1));
  }

  static Future deleteUser() async {
    String endpoint = "$apiEndpoint/auth/local";

    var header = {'Authorization': "Bearer $jwt"};

    await http.delete(Uri.parse(endpoint), headers: header);

    logout();
  }

  Future<http.Response> sendEmailVerification(String email) async {
    String endpoint = "$apiEndpoint/auth/send-email-confirmation";

    final response = await http.post(
      Uri.parse(endpoint),
      body: {
        'email': email,
      },
    );

    return response;
  }

  static Map<String, dynamic> encodeAccount(Account account) {
    Map<String, dynamic> map = account.toJson();

    int achivementsIteration = 0;
    map["achivements"] = account.achivements
        .map((e) => {
              "title": e.title,
              "description": e.description,
              "__temp_key__": achivementsIteration++,
            })
        .toList();

    int awardsIteration = 0;
    map["awards"] = account.awards
        .map((e) => {
              "title": e.title,
              "description": e.description,
              "__temp_key__": awardsIteration++,
            })
        .toList();

    int socialsIteration = 0;
    map["socials"] = account.socials
        .map((e) => {
              "platform": e.platform,
              "value": e.value,
              "visible": e.visible,
              "__temp_key__": socialsIteration++,
            })
        .toList();

    int trainingsIteration = 0;
    map["trainings"] = account.trainings
        .map((e) => {
              "title": e.title,
              "description": e.description,
              "__temp_key__": trainingsIteration++,
            })
        .toList();

    map.remove("phone");

    return map;
  }

  static Account decodeAccount(Map<String, dynamic> map) {
    return Account.fromJson(map);
  }
}
