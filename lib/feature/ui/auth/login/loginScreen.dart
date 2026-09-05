import 'package:e_commerce_app/Core/cache/shared_preference_utils.dart';
import 'package:e_commerce_app/Core/utils/app_styles.dart';
import 'package:e_commerce_app/Core/utils/dialogUtils.dart';
import 'package:e_commerce_app/feature/ui/auth/login/cubit/login_states.dart';
import 'package:e_commerce_app/feature/ui/auth/login/cubit/login_view_model.dart';
import 'package:e_commerce_app/feature/ui/auth/register/registerScreen.dart';
import 'package:e_commerce_app/feature/ui/pages/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Core/utils/app_assets.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/utils/app_validation.dart';
import '../../../../di/di.dart';
import '../../../widgets/auth_botton.dart';
import '../../../widgets/auth_textFormField.dart';
import '../../pages/home_screen/tabs/home_tab/home_tab.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "login";
  LoginViewModel viewModel = getIt<LoginViewModel>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocListener(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context: context);
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(
            context: context,
            title: "Error",
            posAction: "ok",
            content: state.error,
          );
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(
            context: context,
            title: "Success",
            posAction: "ok",
            content: "${state.loginResponseEntity.message}",
          );
          Navigator.of(context).pop();
          SharedPreferenceUtils.saveData(
            key: "token",
            value: state.loginResponseEntity.token,
          );
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.primary,
        body: SafeArea(
          child: Form(
            key: viewModel.formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(AppAssets.auth_logo),
                    SizedBox(height: height * 0.02),
                    authTextFormField(
                      label: "E-mail address",
                      hintText: "enter your email address",
                      controller: viewModel.emailController,
                      validator: AppValidation.emailValidate,
                    ),

                    authTextFormField(
                      label: "Password",
                      hintText: "enter your password",
                      controller: viewModel.passwordController,
                      validator: AppValidation.passwordValidate,
                      isPass: true,
                    ),
                    SizedBox(height: height * 0.23),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterScreen.routeName);
                      },
                      child: Text(
                        "Create Account",
                        style: AppStyle.medium18white,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    AuthButton(
                      name: "Login",
                      onButtonClicked: () {
                        viewModel.login();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
