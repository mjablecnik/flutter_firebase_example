import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:login/common/constants.dart';
import 'package:login/auth/user_model.dart' as model;

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  logout() {
    model.User.remove();
    _auth.signOut();
    Get.offNamed(Routes.LOGIN);
  }

  Future<String> login(LoginData loginData) async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: loginData.name,
        password: loginData.password,
      )).user;

      model.User.fromFirebaseUser(user).save();

      return null;
    } catch (e) {
      return 'Failed to sign in with Email & Password.';
    }
  }

  Future<String> register(LoginData loginData) async {
    try {
      final User user = (await _auth.createUserWithEmailAndPassword(
        email: loginData.name,
        password: loginData.password,
      )).user;
      user.sendEmailVerification(ActionCodeSettings(url: afterEmailVerificationUrl));

      model.User.fromFirebaseUser(user).save();

      return null;
    } catch (e) {
      return e.message;
    }
  }

  Future<String> recoverPassword(String email) async {
    try {
      _auth.sendPasswordResetEmail(email: email);

      return null;
    } catch (e) {
      return e.message;
    }
  }
}
