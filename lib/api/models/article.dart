import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:lions_flutter/api/models/api.dart';

class LionsCollection extends LionsAPI {
  Future<dynamic> fetch({Map<String, String>? parameters}) async {
    http.Response response = await get(parameters: parameters);

    if (response.statusCode == 200) {
      var map = jsonDecode(response.body);

      return map;
    } else {
      throw Exception('Failed to load ');
    }
  }
}
