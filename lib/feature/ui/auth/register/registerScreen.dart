import 'package:e_commerce_app/Core/utils/app_assets.dart';
import 'package:e_commerce_app/Core/utils/app_colors.dart';
import 'package:e_commerce_app/Core/utils/app_validation.dart';
import 'package:e_commerce_app/Core/utils/dialogUtils.dart';
import 'package:e_commerce_app/di/di.dart';
import 'package:e_commerce_app/feature/ui/auth/register/cubit/register_states.dart';
import 'package:e_commerce_app/feature/ui/auth/register/cubit/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/auth_botton.dart';
import '../../../widgets/auth_textFormField.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "register";
  RegisterViewModel viewModel = getIt<RegisterViewModel>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocListener<RegisterViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context: context);
        } else if (state is RegisterErrorState) {
          Navigator.pop(context);
          DialogUtils.showMessage(context: context, title: "Error", posAction: "ok", content: state.error);
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(context: context, title: "Success", posAction: "ok", content: "Register Successfuly");
        }
      },
      child: Scaffold(
        backgroundColor: AppColor.primary,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: viewModel.formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            backgroundColor: AppColor.primary,
                            elevation: 0,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back, color: AppColor.white),
                        ),
                      ],
                    ),
                    Image.asset(AppAssets.auth_logo),

                    SizedBox(height: height * 0.02),

                    authTextFormField(
                      label: "Full Name",
                      hintText: "enter your full name",
                      controller: viewModel.nameController,
                      validator: AppValidation.nameValidate,
                    ),

                    authTextFormField(
                      label: "Mobile Number",
                      hintText: "enter your mobile no.",
                      controller: viewModel.phoneController,
                      validator: AppValidation.phoneValidate,
                    ),

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
                    authTextFormField(
                      label: "rePassword",
                      hintText: "enter rePassword",
                      controller: viewModel.rePasswordController,
                      validator: AppValidation.passwordValidate,
                      isPass: true,
                    ),
                    AuthButton(
                      name: "Register",
                      onButtonClicked: () {
                        viewModel.register();
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
