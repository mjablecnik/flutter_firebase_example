import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:login/auth/auth_controller.dart';
import 'package:login/common/constants.dart';
import 'package:login/items/Item_repository.dart';
import 'package:login/items/item_controller.dart';
import 'package:login/dialog/dialog_controller.dart';
import 'package:login/auth/auth_view.dart';
import 'package:login/items/item_view.dart';
import 'package:login/auth/user_model.dart';
import 'package:path_provider/path_provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final directory = await getTemporaryDirectory();
  Hive
    ..init(directory.path)
    ..registerAdapter(UserAdapter());

  await Hive.openBox(cacheName);

  var initRoute = User.load() == null ? Routes.LOGIN : Routes.ITEMS;

  runApp(
    GetMaterialApp(
      smartManagement: SmartManagement.full,
      initialRoute: initRoute,
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => ItemController(), fenix: true);
        Get.lazyPut(() => ItemRepository(), fenix: true);
        Get.lazyPut(() => AuthController(), fenix: true);
        Get.lazyPut(() => DialogController(), fenix: true);
      }),
      getPages: [
        GetPage(name: Routes.LOGIN, page: () => LoginView()),
        GetPage(name: Routes.ITEMS, page: () => ItemView()),
      ]),
  );
}
