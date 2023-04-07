import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class RestAPI {
  static Future<http.Response> get(Uri uri,
      {Map<String, String>? headers}) async {
    log("GET: $uri headers: $headers");
    return await http.get(uri, headers: headers);
  }

  static Future<http.Response> post(Uri uri,
      {Map<String, String>? headers, body, Encoding? encoding}) async {
    log("POST: $uri headers: $headers body: $body");
    return await http.post(uri,
        headers: headers, body: body, encoding: encoding);
  }

  static Future<http.Response> put(Uri uri,
      {Map<String, String>? headers, body, Encoding? encoding}) async {
    log("PUT: $uri headers: $headers body: $body");
    return await http.put(uri,
        headers: headers, body: body, encoding: encoding);
  }

  static Future<http.Response> delete(Uri uri,
      {Map<String, String>? headers}) async {
    log("DELETE: $uri headers: $headers");
    return await http.delete(uri, headers: headers);
  }
}
