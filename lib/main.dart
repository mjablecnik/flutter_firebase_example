import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login/auth/auth_controller.dart';
import 'package:login/common/constants.dart';
import 'package:login/common/utils.dart';
import 'package:login/items/item_controller.dart';
import 'package:login/dialog/dialog_controller.dart';
import 'package:login/auth/auth_view.dart';
import 'package:login/items/item_view.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  
  final initRoute = getUser() == null ? Routes.LOGIN : Routes.ITEMS;

  runApp(
    GetMaterialApp(
      smartManagement: SmartManagement.full,
      initialRoute: initRoute,
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => BasicController(), fenix: true);
        Get.lazyPut(() => AuthController(), fenix: true);
        Get.lazyPut(() => DialogController(), fenix: true);
      }),
      getPages: [
        GetPage(name: Routes.LOGIN, page: () => LoginView()),
        GetPage(name: Routes.ITEMS, page: () => ItemView()),
      ]),
  );
}
