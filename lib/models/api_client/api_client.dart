import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lions_flutter/models/api_exception/api_exception.dart';

class ApiClient {
  final String _baseUrl;
  http.Client client = http.Client();

  ApiClient(this._baseUrl);

  Future<dynamic> _processResponse(http.Response response) async {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw ApiException.fromJson(json.decode(response.body)["error"]);
    }
  }

  Future<dynamic> get(String path,
      {Map<String, String>? parameters, Map<String, String>? headers}) async {
    var uri = Uri.https(_baseUrl, path, parameters);
    var response = await http.get(uri, headers: headers);
    return _processResponse(response);
  }

  Future<dynamic> post(String path,
      {dynamic body,
      Map<String, String>? parameters,
      Map<String, String>? headers}) async {
    var uri = Uri.https(_baseUrl, path, parameters);
    var response = await http.post(
      uri,
      headers: headers,
      body: json.encode(body),
    );
    return _processResponse(response);
  }

  Future<dynamic> put(String path,
      {dynamic body,
      Map<String, String>? parameters,
      Map<String, String>? headers}) async {
    var uri = Uri.https(_baseUrl, path, parameters);
    var response = await http.put(
      uri,
      headers: headers,
      body: json.encode(body),
    );
    return _processResponse(response);
  }

  Future<void> delete(String path,
      {Map<String, String>? parameters, Map<String, String>? headers}) async {
    var uri = Uri.https(_baseUrl, path, parameters);
    var response = await http.delete(uri, headers: headers);

    if (response.statusCode != 200 && response.statusCode != 204) {
      throw ApiException.fromJson(json.decode(response.body));
    }
  }
}
