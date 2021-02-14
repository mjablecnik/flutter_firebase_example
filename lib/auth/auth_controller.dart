import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var count = 0.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> login(LoginData loginData) async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: loginData.name,
        password: loginData.password,
      )).user;
      return null;
    } catch (e) {
      return 'Failed to sign in with Email & Password';
    }
  }
}

