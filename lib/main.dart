import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:login/auth/auth_controller.dart';
import 'package:login/common/constants.dart';
import 'package:login/items/item_controller.dart';
import 'package:login/dialog/dialog_controller.dart';
import 'package:login/auth/auth_view.dart';
import 'package:login/items/item_view.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    GetMaterialApp(
      smartManagement: SmartManagement.full,
      initialRoute: Routes.HOME,
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => BasicController(), fenix: true);
        Get.lazyPut(() => AuthController(), fenix: true);
        Get.lazyPut(() => DialogController(), fenix: true);
      }),
      getPages: [
        GetPage(name: Routes.HOME, page: () => LoginView()),
        GetPage(name: Routes.ITEMS, page: () => ItemView()),
      ]),
  );
}
