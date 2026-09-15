import 'package:e_commerce_app/Core/cache/shared_preference_utils.dart';
import 'package:e_commerce_app/Core/utils/app_colors.dart';
import 'package:e_commerce_app/Core/utils/app_styles.dart';
import 'package:e_commerce_app/feature/ui/auth/login/loginScreen.dart';
import 'package:e_commerce_app/feature/ui/pages/home_screen/tabs/user_tab/custom_appbar_details.dart';
import 'package:e_commerce_app/feature/ui/pages/home_screen/tabs/user_tab/custom_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserTab extends StatefulWidget {
  static const String routeName = "user_tab";

  const UserTab({super.key});

  @override
  State<UserTab> createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        toolbarHeight: 160.h,
        leadingWidth: double.infinity,
        leading: CustomAppbarDetails(),
        actions: [
          Container(
            width: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.all(Radius.circular(12)),
                ),
                // shadowColor: Colors.transparent,
                iconColor: AppColor.primary,
                shadowColor: Colors.transparent,
                overlayColor: Colors.transparent,
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
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Your full name",
              style: AppStyle.regular14darkBlue.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 12.h),
            CustomFormFiled(
              controller: TextEditingController(
                text: SharedPreferenceUtils.getData(key: "name"),
              ),
              obscureText: false,
            ),
            SizedBox(height: 24.h),
            Text(
              "Your E_mail",
              style: AppStyle.regular14darkBlue.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 12.h),
            CustomFormFiled(
              controller: TextEditingController(
                text: SharedPreferenceUtils.getData(key: "email"),
              ),
        
              obscureText: false,
            ),
            SizedBox(height: 24.h),
            Text(
              "Your password",
              style: AppStyle.regular14darkBlue.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 12.h),
            CustomFormFiled(
              controller: TextEditingController(
                text: SharedPreferenceUtils.getData(key: "password"),
              ),
              obscureText: true,
            ),
            SizedBox(height: 24.h),
            Text(
              "Your mobile number",
              style: AppStyle.regular14darkBlue.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 12.h),
            CustomFormFiled(
              controller: TextEditingController(
                text: SharedPreferenceUtils.getData(key: "phone"),
              ),
              obscureText: false,
            ),
            SizedBox(height: 24.h),
            Text(
              "Your Address",
              style: AppStyle.regular14darkBlue.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 12.h),
            CustomFormFiled(
              controller: TextEditingController(
                text: "Add your address here",
              ),
              obscureText: false,
            ),
          ],
        ),
      ),
    );
  }
}
