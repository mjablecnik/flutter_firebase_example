import 'package:hive/hive.dart';
import 'package:login/common/constants.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

part 'user_model.g.dart';

@HiveType(typeId: 1)
class User {

  @HiveField(0)
  String displayName;

  @HiveField(1)
  String email;

  @HiveField(2)
  String phone;

  @HiveField(3)
  String avatarUrl;

  @HiveField(4)
  String bio;

  User();

  factory User.fromFirebaseUser(firebase.User user) {
    return User()
      ..displayName = user.displayName
      ..email = user.email
      ..phone = user.phoneNumber
      ..avatarUrl = user.photoURL;
  }

  factory User.load() {
    return Hive.box(cacheName).get("user");
  }

  save() {
    Hive.box(cacheName).put("user", this);
  }

  static remove() {
    return Hive.box(cacheName).clear();
  }
}
