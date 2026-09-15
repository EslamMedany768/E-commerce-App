import 'package:e_commerce_app/Core/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../Core/utils/app_colors.dart';

class CustomFormFiled extends StatefulWidget {
  bool obscureText;

  TextInputType? keyboardType;
  TextEditingController controller;
  String? Function(String?)? vaildatorFunc;

  CustomFormFiled({
    super.key,
    required this.controller,
    this.keyboardType,
    this.vaildatorFunc,
    required this.obscureText,
  });

  @override
  State<CustomFormFiled> createState() => _CustomFormFiledState();
}

class _CustomFormFiledState extends State<CustomFormFiled> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      controller: widget.controller,
      style: AppStyle.regular12darkBlue,
      validator: widget.vaildatorFunc,

      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),


        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: AppColor.greyBlue),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: AppColor.greyBlue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: AppColor.greyBlue),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
