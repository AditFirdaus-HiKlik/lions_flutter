import 'dart:convert';

import 'package:lions_flutter/models/api_client/api_client.dart';
import 'package:lions_flutter/models/api_exception/api_exception.dart';

class ContentService {
  ContentService();

  static Future<dynamic> fetchCollection(String path,
      {Map<String, String>? parameters, Map<String, String>? headers}) async {
    var response = await ApiClient.get(
      '/api/$path',
      headers: headers,
      parameters: parameters,
    );

    var responseJson = json.decode(response.body);

    if (response.statusCode == 200) {
      return responseJson;
    } else {
      throw ApiException.fromJson(responseJson["error"]);
    }
  }
}
