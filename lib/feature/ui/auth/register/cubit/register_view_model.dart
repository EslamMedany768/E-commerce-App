import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/use_cases/register_use_case.dart';
import 'package:e_commerce_app/feature/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  RegisterViewModel({required this.registerUseCase}) : super(RegisterInitialState());

  ///hold data & handle logic
  TextEditingController nameController = TextEditingController(text: "Ahmed Abd Al-Muti");
  TextEditingController phoneController = TextEditingController(text: "01010700701");
  TextEditingController emailController = TextEditingController(text: "ahmedmutmmtfdfgin4012@gmail.com");
  TextEditingController passwordController = TextEditingController(text: "Ahmed@123");
  TextEditingController rePasswordController = TextEditingController(text: "Ahmed@123");
  var formKey = GlobalKey<FormState>();

  register() async {
    emit(RegisterLoadingState());

    var either = await registerUseCase.invoke(
      nameController.text,
      emailController.text,
      passwordController.text,
      rePasswordController.text,
      phoneController.text,
    );
    either.fold(
      (failure) {
        emit(RegisterErrorState(error: failure.errorName));
      },
      (response) {
        emit(RegisterSuccessState(registerResponseEntity: response));
      },
    );
  }
}
