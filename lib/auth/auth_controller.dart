import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login/user/user_model.dart' as model;

class AuthController extends GetxController {
  final box = GetStorage();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> login(LoginData loginData) async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: loginData.name,
        password: loginData.password,
      )).user;

      box.write('user',
          model.User()
            ..displayName = user.displayName
            ..email = user.email
            ..phone = user.phoneNumber
            ..avatarUrl = user.photoURL
      );
      return null;
    } catch (e) {
      return 'Failed to sign in with Email & Password';
    }
  }
}
