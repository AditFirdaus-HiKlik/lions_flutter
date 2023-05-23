import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

const String apiKey =
    "25222dc25a7a8cb2dc858088c8eb72ccff72ba49f7334047e3d3420fac9a45317c26712e20a5066062328de93c7043b61b3284e837281db08ca60101b76535ada01b4ff99683219441592f9041e0f0d8a84318a91b1eae1aef471654136c3880947ee1e23f3e671831a290444dadb143532d7f44163a015c8bd8c60327986ce7";

set userJWT(String jwt) => LionsPrefs.instance.setString("user_jwt", jwt);
String get userJWT => LionsPrefs.instance.getString("user_jwt") ?? "";

// String get apiEndpoint =>
//     FirebaseRemoteConfig.instance.getString("server_endpoint");
String get apiEndpoint => "https://lions.up.railway.app";

class LionsPrefs {
  static late SharedPreferences instance;

  static Future<void> init() async {
    log("Initialize LionsPrefs...");
    instance = await SharedPreferences.getInstance();
  }
}
