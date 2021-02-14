class User {
  String displayName;
  String email;
  String phone;
  String avatarUrl;
  String bio;

  User();

  Map<String, String> toJson() {
    return {
      "displayName": displayName,
      "email": email,
      "phone": phone,
      "avatarUrl": avatarUrl,
      "bio": bio,
    };
  }

  factory User.fromJson(map) {
    return User()
      ..displayName = map["displayName"]
      ..email = map["email"]
      ..phone = map["phone"]
      ..avatarUrl = map["avatarUrl"]
      ..bio = map["bio"];
  }
}