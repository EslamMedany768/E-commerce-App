import 'package:e_commerce_app/domain/entities/RegisterResponseEntity.dart';

abstract class RegisterStates {}
class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{
  RegisterResponseEntity registerResponseEntity;
  RegisterSuccessState({required this.registerResponseEntity});
}
class RegisterErrorState extends RegisterStates{
  String error;
  RegisterErrorState({required this.error});
}
class RegisterInitialState extends RegisterStates{}