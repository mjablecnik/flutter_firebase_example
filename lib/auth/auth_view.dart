import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:login/auth/auth_controller.dart';
import 'package:login/items/item_view.dart';


class LoginView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'MY-CORP',
      logo: 'assets/icon.png',
      onLogin: (email) => controller.login(email),
      onSignup: (_) => Future.delayed(Duration(seconds: 5), () => null),
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ItemView(),
        ));
      },
      onRecoverPassword: (_) => Future(null),
      messages: LoginMessages(usernameHint: "Email"),
      headerMarginTop: 80,
      headerMarginBottom: 30,
      emailValidator: (email) { return null; },
    );
  }
}

