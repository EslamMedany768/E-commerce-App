import '../../../../../domain/entities/LoginResponseEntity.dart';

abstract class LoginStates {}
class LoginLoadingState extends LoginStates{}
class LoginInitialState extends LoginStates{}
class LoginErrorState extends LoginStates{
  String error;
  LoginErrorState({required this.error});
}
class LoginSuccessState extends LoginStates{
  LoginResponseEntity loginResponseEntity;
  LoginSuccessState({required this.loginResponseEntity});
}