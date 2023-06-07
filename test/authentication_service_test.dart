// Import the test package
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lions_flutter/models/api_client/api_client.dart';
import 'package:lions_flutter/models/authentication_service/authentication_service.dart';
import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  group('AuthenticationService', () {
    late AuthenticationService authService;

    setUp(() {
      var apiClient = ApiClient("lions.up.railway.app");
      authService = AuthenticationService(apiClient);
    });

    test('Get me with bearer token', () async {
      var account = await authService.getAccount(
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjgzODY1NjQwLCJleHAiOjE2ODY0NTc2NDB9.FH_ptzu3doTlsIhDjH8TfalC5C1HjbEfXiq3O08PJr0");
      expect(account.id, 1);
    });
  });
}
