import 'package:e_commerce_app/domain/use_cases/login_use_case.dart';
import 'package:e_commerce_app/feature/ui/auth/login/cubit/login_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;

  LoginViewModel({required this.loginUseCase}) : super(LoginInitialState());
  TextEditingController emailController = TextEditingController(
    text: "ahmedmutti1@gmail.com",
  );
  TextEditingController passwordController = TextEditingController(
    text: "Ahmed@123",
  );
  var formKey = GlobalKey<FormState>();

  login() async {
    if (formKey.currentState!.validate() == true) {
      emit(LoginLoadingState());
      var either = await loginUseCase.invoke(
        emailController.text,
        passwordController.text,
      );
      either.fold(
        
        (failure) => emit(LoginErrorState(error: failure.errorName)),
        (response) => emit(LoginSuccessState(loginResponseEntity: response)),
      );
    }
  }
}
