import 'dart:io';

bool isValidURL(String url) {
  return Uri.tryParse(url)?.isAbsolute ?? false;
}

Future<bool> isConnectedToInternet() async {
  bool connectionResult = false;
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      connectionResult = true;
    }
  } on SocketException catch (_) {}

  return connectionResult;
}
