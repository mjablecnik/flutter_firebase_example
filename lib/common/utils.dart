// File for various useful functions


import 'package:get_storage/get_storage.dart';
import 'package:login/user/user_model.dart';

User getUser() {
  final box = GetStorage();
  final userMap = box.read('user');
  return User.fromJson(userMap);
}