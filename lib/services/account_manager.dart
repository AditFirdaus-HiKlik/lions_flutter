import 'dart:convert';

import 'package:lions_flutter/api/api.dart';
import 'package:lions_flutter/models/account/account.dart';
import 'package:http/http.dart' as http;

class AccountManager {
  static String get jwt => LionsPrefs.instance.getString("jwtToken") ?? "";
  static set jwt(String token) =>
      LionsPrefs.instance.setString("jwtToken", token);

  static get isLoggedIn => jwt != "";

  static Account get account => getLocalAccount();
  static Future setAccount(Account account, {bool sync = false}) async {
    Map<String, dynamic> accountMap = account.toJson();

    LionsPrefs.instance.setString("account", accountMap.toString());

    if (sync) {
      String endpoint = "$apiEndpoint/users/${account.id}";

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $jwt"
      };

      Map<String, dynamic> body = encodeAccount(account);

      await http.post(Uri.parse(endpoint), headers: headers, body: body);
    }
  }

  static Future<Account> getAccount({bool sync = false}) async {
    if (sync) {
      String endpoint = "$apiEndpoint/users/me";

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
    } else {
      String accountString = LionsPrefs.instance.getString("account") ?? "";
      Map<String, dynamic> accountMap = jsonDecode(accountString);
      Account account = Account.fromJson(accountMap);
      return account;
    }
  }

  static Account getLocalAccount() {
    String accountString = LionsPrefs.instance.getString("account") ?? "";
    Map<String, dynamic> accountMap = jsonDecode(accountString);
    Account account = Account.fromJson(accountMap);

    return account;
  }

  static Future<bool> checkEmailVerified() async {
    Account account = await getAccount(sync: true);

    return account.confirmed;
  }

  static Future<http.Response> login(String identifier, String password,
      {Function? onSuccess, Function(String)? onFailed}) async {
    String endpoint = "$apiEndpoint/auth/local";

    Map<String, String> headers = {"Content-Type": "application/json"};

    Map<String, String> body = {};

    body["identifier"] = identifier;
    body["password"] = password;

    String bodyJson = jsonEncode(body);

    var result =
        await http.post(Uri.parse(endpoint), body: bodyJson, headers: headers);

    if (result.statusCode == 200) {
      var body = jsonDecode(result.body);
      AccountManager.jwt = body[["jwt"]];

      bool isConfirmed = body["user"]["confirmed"];

      if (!isConfirmed) {
        onFailed?.call("Email is not confirmed");
        return result;
      }

      Account account = decodeAccount(body);

      setAccount(account);

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

      Account account = decodeAccount(body[["jwt"]]);

      setAccount(account);

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
    return account.toJson();
  }

  static Account decodeAccount(Map<String, dynamic> map) {
    return Account.fromJson(map);
  }
}
