import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AppAuth {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static String errorMessage = "";

  static Future<UserCredential?> trySignIn(
      String email, String password) async {
    log("Trying to SignIn...", name: "auth.dart");

    final userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    log("SignIn with UserCredential: $userCredential", name: "auth.dart");

    return userCredential;
  }

  static Future<UserCredential> trySignUp(String email, String password) async {
    log("Trying to SignUp...", name: "auth.dart");

    final userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    log("SignUp with UserCredential: $userCredential", name: "auth.dart");

    if (userCredential.additionalUserInfo!.isNewUser) {
      log("Account is new User", name: "auth.dart");
      sendLink();
    }

    return userCredential;
  }

  static Future sendLink() async {
    log("Sending Email Verification link...", name: "auth.dart");
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }
}
