import 'package:e_commerce_app/domain/entities/LoginResponseEntity.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti1@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0MDdiMWZkNDUwYjYyMGZkYmM3MDc3ZiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzY5ODEyMjQ3LCJleHAiOjE3Nzc1ODgyNDd9._S4XaLcpIPSupgHlVe3_LC5d7Fo4lXjiu17ta3Q_3Zo"

class LoginResponseDm extends LoginResponseEntity {
  LoginResponseDm({super.message, super.statusMsg, super.user, super.token});

  LoginResponseDm.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDM.fromJson(json['user']) : null;
    token = json['token'];
  }
}

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmutti1@gmail.com"
/// role : "user"

class UserDM extends UserEntity {
  UserDM({super.name, super.email, super.role});

  UserDM.fromJson(dynamic json) {
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
