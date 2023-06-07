import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lions_flutter/models/account/account.dart';
import 'package:lions_flutter/models/api_client/api_client.dart';
import 'package:lions_flutter/models/api_exception/api_exception.dart';

class AuthenticationService {
  ApiClient _apiClient;

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  AuthenticationService(this._apiClient);

  Future<dynamic> login(String email, String password) async {
    var response = await _apiClient.post(
      '/api/auth/local',
      body: {
        "identifier": email,
        "password": password,
      },
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.containsKey('jwt') && response.containsKey('user')) {
      // await _secureStorage.write(key: 'jwt', value: response['jwt']);

      return Account.fromJson(response['user']);
    } else {
      throw ApiException.fromJson(response["error"]);
    }
  }

  Future<dynamic> getAccount(String bearerToken) async {
    var response = await _apiClient.get(
      '/api/users/me',
      headers: {
        "Authorization": "Bearer $bearerToken",
      },
      parameters: {"populate": "*"},
    );

    if (response.containsKey('id')) {
      return Account.fromJson(response);
    } else {
      throw ApiException.fromJson(response["error"]);
    }
  }

  Future<void> logout() async {
    // await _secureStorage.delete(key: 'jwt');
  }

  Future<String?> getToken() async {
    // Read the JWT token from secure storage
    // return await _secureStorage.read(key: 'jwt');
  }
}
