import 'package:e_commerce_app/domain/entities/RegisterResponseEntity.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmuttii4012bf@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5NmQ3M2Y5ZmM5YTIxZTBlNjQ4MWY3MiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzY4NzgwNzkzLCJleHAiOjE3NzY1NTY3OTN9.jqcJ2IbPRm9GhdadU7sPwKNHZSJExfrr-xbrcPNhGBk"

class RegisterResponseDm extends RegisterResponseEntity {
  RegisterResponseDm({supermessage, super.user, super.token, super.statusMsg});

  RegisterResponseDm.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }
}

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmuttii4012bf@gmail.com"
/// role : "user"

class User extends UserEntity {
  User({super.name, super.email, super.role});

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }
}
