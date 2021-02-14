import 'package:hive/hive.dart';
import 'package:login/common/constants.dart';

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

  save() {
    Hive.box(cacheName).put("user", this);
  }

  factory User.load() {
    return Hive.box(cacheName).get("user");
  }
}
