import 'dart:developer';

import 'package:http/http.dart' as http;

class LionsAPI {
  bool useJWT = false;
  bool useApiKey = false;

  Future<String> get apiKey async => "";

  Future<String> get jwt async => "";

  String url = 'https://lions.up.railway.app/api';
  String path = '';

  Future<String> get endpoint async => url + path;

  LionsAPI({this.useJWT = false, this.useApiKey = false});

  Future<Map<String, String>> getHeader() async {
    Map<String, String> headers = {};

    if (useApiKey) headers['Authorization'] = 'Bearer ${await apiKey}';

    if (useJWT) headers['Authorization'] = 'Bearer ${await jwt}';

    return headers;
  }

  // Post, Get, Put, Delete
  Future<http.Response> post(
      {Map<String, String>? headers,
      Map<String, String>? parameters,
      Map<String, dynamic>? body}) async {
    headers = headers ?? {};

    headers.addAll(await getHeader());

    String finalEndpoint = await endpoint + parseQueryString(parameters ?? {});

    return await http.post(Uri.parse(finalEndpoint),
        headers: headers, body: body);
  }

  Future<http.Response> get(
      {Map<String, String>? headers, Map<String, String>? parameters}) async {
    headers = headers ?? {};

    headers.addAll(await getHeader());

    String finalEndpoint = await endpoint + parseQueryString(parameters ?? {});

    log(finalEndpoint);

    return await http.get(Uri.parse(finalEndpoint), headers: headers);
  }

  Future<http.Response> put(
      {Map<String, String>? headers,
      Map<String, String>? parameters,
      Map<String, dynamic>? body}) async {
    headers = headers ?? {};

    headers.addAll(await getHeader());

    String finalEndpoint = await endpoint + parseQueryString(parameters ?? {});

    return await http.put(Uri.parse(finalEndpoint),
        headers: headers, body: body);
  }

  Future<http.Response> delete(
      {Map<String, String>? headers, Map<String, String>? parameters}) async {
    headers = headers ?? {};

    headers.addAll(await getHeader());

    String finalEndpoint = await endpoint + parseQueryString(parameters ?? {});

    return await http.delete(Uri.parse(finalEndpoint), headers: headers);
  }

  String parseQueryString(Map<String, dynamic> parameters) {
    String queryString = '';

    if (parameters.isNotEmpty) {
      queryString += '?';
      parameters.forEach((key, value) => queryString += "&$key=$value");
    }

    return queryString;
  }
}
