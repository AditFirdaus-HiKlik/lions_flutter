import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ApiClient {
  static String _baseUrl = "";
  http.Client client = http.Client();

  static Future setBaseUrl(String baseUrl) {
    log("[INFO] [${DateTime.now()}] Setting base url to $baseUrl");
    _baseUrl = baseUrl;
    return Future.value();
  }

  static Future<http.Response> get(String path,
      {Map<String, String>? parameters, Map<String, String>? headers}) async {
    log("[INFO] [${DateTime.now()}] GET $path");
    var uri = Uri.https(_baseUrl, path, parameters);
    var response = await http.get(uri, headers: headers);
    return response;
  }

  static Future<http.Response> post(String path,
      {dynamic body,
      Map<String, String>? parameters,
      Map<String, String>? headers}) async {
    log("[INFO] [${DateTime.now()}] POST $path");
    var uri = Uri.https(_baseUrl, path, parameters);
    var response = await http.post(
      uri,
      headers: headers,
      body: json.encode(body),
    );
    return response;
  }

  static Future<http.Response> put(String path,
      {dynamic body,
      Map<String, String>? parameters,
      Map<String, String>? headers}) async {
    log("[INFO] [${DateTime.now()}] PUT $path");
    var uri = Uri.https(_baseUrl, path, parameters);
    var response = await http.put(
      uri,
      headers: headers,
      body: json.encode(body),
    );
    return response;
  }

  static Future<http.Response> delete(String path,
      {Map<String, String>? parameters, Map<String, String>? headers}) async {
    log("[INFO] [${DateTime.now()}] DELETE $path");
    var uri = Uri.https(_baseUrl, path, parameters);
    var response = await http.delete(uri, headers: headers);
    return response;
  }
}
