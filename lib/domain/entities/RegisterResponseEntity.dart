/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmuttii4012bf@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5NmQ3M2Y5ZmM5YTIxZTBlNjQ4MWY3MiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzY4NzgwNzkzLCJleHAiOjE3NzY1NTY3OTN9.jqcJ2IbPRm9GhdadU7sPwKNHZSJExfrr-xbrcPNhGBk"

class RegisterResponseEntity {
  RegisterResponseEntity({this.message, this.user, this.token,this.statusMsg});

  String? message;
  UserEntity? user;
  String? token;
  String? statusMsg;
}

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmuttii4012bf@gmail.com"
/// role : "user"

class UserEntity {
  UserEntity({this.name, this.email, this.role});

  String? name;
  String? email;
  String? role;
}
