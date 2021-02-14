import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:login/auth/auth_controller.dart';
import 'package:login/common/constants.dart';


class LoginView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'MY-CORP',
      logo: 'assets/icon.png',
      onLogin: controller.login,
      onSignup: controller.register,
      onSubmitAnimationCompleted: () {
        Get.offNamed(Routes.ITEMS);
      },
      onRecoverPassword: (_) => Future(null),
      messages: LoginMessages(usernameHint: "Email"),
      headerMarginTop: 80,
      headerMarginBottom: 30,
      emailValidator: (email) { return null; },
    );
  }
}

