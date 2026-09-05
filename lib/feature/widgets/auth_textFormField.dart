import 'package:e_commerce_app/Core/utils/app_colors.dart';
import 'package:e_commerce_app/Core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class authTextFormField extends StatefulWidget {
  String? Function(String?)? validator;
  TextEditingController? controller;
  String hintText;
  String label;
  bool isPass;

  authTextFormField({
    super.key,
    this.validator,
    this.controller,
    required this.hintText,
    required this.label,
    this.isPass = false,
  });

  @override
  State<authTextFormField> createState() => _authTextFormFieldState();
}

class _authTextFormFieldState extends State<authTextFormField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: AppStyle.medium18white),
        SizedBox(height: height * 0.02),
        TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          obscureText: isVisible ? true : false,
          cursorColor: AppColor.primary,
          decoration: InputDecoration(
            suffixIcon: widget.isPass
                ? IconButton(
                    icon: Icon(
                      isVisible ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      isVisible = !isVisible;
                      setState(() {});
                    },
                  )
                : SizedBox(),
            filled: true,
            fillColor: AppColor.white,
            hintText: widget.hintText,
            hintStyle: AppStyle.light18black,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: AppColor.white),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: AppColor.white),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: AppColor.white),
            ),
          ),
          style: AppStyle.light18black.copyWith(decorationThickness: 0),
        ),
        SizedBox(height: height * 0.04),
      ],
    );
  }
}
