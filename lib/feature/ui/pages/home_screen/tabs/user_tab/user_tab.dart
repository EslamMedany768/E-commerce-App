import 'package:e_commerce_app/Core/cache/shared_preference_utils.dart';
import 'package:e_commerce_app/Core/utils/app_colors.dart';
import 'package:e_commerce_app/feature/ui/auth/login/loginScreen.dart';
import 'package:flutter/material.dart';

class UserTab extends StatelessWidget {
  static const String routeName = "user_tab";

  const UserTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primary,
              iconColor: Colors.white,
            ),
            onPressed: () {
              SharedPreferenceUtils.deleteData(key: "token");

              Navigator.pushNamedAndRemoveUntil(
                context,
                LoginScreen.routeName,
                (route) => false,
              );
            },
            child: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
