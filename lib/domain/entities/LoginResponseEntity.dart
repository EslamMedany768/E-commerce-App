/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti1@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0MDdiMWZkNDUwYjYyMGZkYmM3MDc3ZiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzY5ODEyMjQ3LCJleHAiOjE3Nzc1ODgyNDd9._S4XaLcpIPSupgHlVe3_LC5d7Fo4lXjiu17ta3Q_3Zo"

class LoginResponseEntity {
  LoginResponseEntity({
      this.message, 
      this.statusMsg,
      this.user,
      this.token,});

  String? message;
  String? statusMsg;
  UserEntity? user;
  String? token;



}

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmutti1@gmail.com"
/// role : "user"

class UserEntity {
  UserEntity({
      this.name, 
      this.email, 
      this.role,});


  String? name;
  String? email;
  String? role;


}