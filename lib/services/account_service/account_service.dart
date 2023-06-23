import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lions_flutter/models/account/account.dart';
import 'package:lions_flutter/models/api_client/api_client.dart';
import 'package:lions_flutter/models/api_exception/api_exception.dart';

class AccountService {
  static const FlutterSecureStorage secureStorage = FlutterSecureStorage();

  AccountService();

  static Future<bool> isAuthenticated() async {
    var jwt = await secureStorage.read(key: 'jwt');

    if (jwt != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<Account> getLocalAccount() async {
    final json = await secureStorage.read(key: 'account');
    if (json != null) {
      return Account.fromJson(jsonDecode(json));
    }
    return const Account();
  }

  static Future<void> setLocalAccount(Account account) async {
    await secureStorage.write(
        key: 'account', value: jsonEncode(account.toJson()));
  }

  static Future<dynamic> login(String email, String password) async {
    var response = await ApiClient.post(
      '/api/auth/local',
      body: {
        "identifier": email,
        "password": password,
      },
      headers: {
        "Content-Type": "application/json",
      },
    );

    var responseJson = json.decode(response.body);

    if (responseJson.containsKey('jwt') && responseJson.containsKey('user')) {
      await secureStorage.write(key: 'jwt', value: responseJson['jwt']);

      var account = Account.fromJson(responseJson['user']);

      await setLocalAccount(account);

      return account;
    } else {
      throw ApiException.fromJson(responseJson["error"]);
    }
  }

  static Future<dynamic> register(
      String username, String email, String password) async {
    var body = {
      "username": username,
      "email": email,
      "password": password,
    };

    log(body.toString());

    var headers = {
      "Content-Type": "application/json",
    };

    var response = await ApiClient.post(
      '/api/auth/local/register',
      body: body,
      headers: headers,
    );

    var responseJson = json.decode(response.body);

    log(response.body);

    if (responseJson.containsKey('jwt') && responseJson.containsKey('user')) {
      await secureStorage.write(key: 'jwt', value: responseJson['jwt']);

      var account = Account.fromJson(responseJson['user']);

      await setLocalAccount(account);

      return account;
    } else {
      throw ApiException.fromJson(responseJson["error"]);
    }
  }

  static Future<dynamic> sendEmailVerification() async {
    var jwt = await secureStorage.read(key: 'jwt');

    var response = await ApiClient.post(
      '/api/account/send-email-verification',
      headers: {
        "Authorization": "Bearer $jwt",
      },
    );

    if (response.statusCode == 204) {
      return true;
    } else {
      var responseJson = json.decode(response.body);
      throw ApiException.fromJson(responseJson["error"]);
    }
  }

  static Future<dynamic> getAccount() async {
    var bearerToken = await getBearerToken();

    var headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $bearerToken"
    };

    var parameters = {
      'populate': '*',
      'populate[0]': 'avatar',
      'populate[1]': 'phone',
      'populate[2]': 'district',
      'populate[3]': 'club',
      'populate[4]': 'awards',
      'populate[5]': 'achivements',
      'populate[6]': 'social',
      'populate[7]': 'trainings',
      'populate[8]': 'position',
    };

    var response = await ApiClient.get(
      '/api/users/me',
      headers: headers,
      parameters: parameters,
    );

    if (response.statusCode == 200) {
      var bodyJson = json.decode(response.body);

      var account = AccountConverter.decodeAccount(bodyJson);

      await setLocalAccount(account);

      return account;
    } else {
      throw Exception("Failed to load account");
    }
  }

  static Future<dynamic> setAccount(Account account) async {
    var id = account.id;

    var bearerToken = await getBearerToken();

    var headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $bearerToken",
    };

    Map<String, dynamic> bodyJson = AccountConverter.encodeAccount(account);

    var response = await ApiClient.put(
      '/api/users/$id',
      body: bodyJson,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var bodyJson = json.decode(response.body);
      return AccountConverter.decodeAccount(bodyJson);
    } else {
      log(response.request.toString());
      log(response.body);
      throw Exception("Failed to set account");
    }
  }

  static Future<void> logout() async {
    await secureStorage.delete(key: 'jwt');
  }

  static Future<int> getID() async {
    var bearerToken = await getBearerToken();

    var response = await ApiClient.get(
      '/api/users/me',
      headers: {
        "Authorization": "Bearer $bearerToken",
      },
      parameters: {
        "fields[0]": "id",
      },
    );

    var responseJson = json.decode(response.body);

    return responseJson['id'];
  }

  static Future<String?> getBearerToken() async {
    return await secureStorage.read(key: 'jwt');
  }
}

class AccountConverter {
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
    var account = Account.fromJson(map);
    log(account.toJson().toString());
    return account;
  }
}
