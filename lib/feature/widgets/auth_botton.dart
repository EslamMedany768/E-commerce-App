import 'package:e_commerce_app/Core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  String name;
  Function()? onButtonClicked;

  AuthButton({super.key, required this.name,required this.onButtonClicked});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
      onPressed: onButtonClicked,
      child: Text(name, style: AppStyle.semi20blue),
    );
  }
}
