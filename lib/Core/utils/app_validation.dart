import 'package:flutter/material.dart';

class AppValidation {
  static String? nameValidate(String? val) {
    if (val == null) {
      return "Please Enter Name";
    } else if (val.trim().isEmpty) {
      return "Please Enter Valid name";
    } else if (val.length < 10) {
      return "Please Enter Your Full Name";
    } else {
      return null;
    }
  }

  static String? emailValidate(String? val) {
    var regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+"
      r"-/=?^_`{|}~]+@["
      r"a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (val == null) {
      return "Please Enter your email";
    } else if (val.trim().isEmpty) {
      return "Please Enter valid email";
    } else if (regex.hasMatch(val) == false) {
      return "Please enter Valid Email";
    } else {
      return null;
    }
  }

  static String? phoneValidate(String? val) {
    if (val == null) {
      return "Please Enter phone";
    } else if (val.trim().isEmpty) {
      return "Please Enter Valid Phone";
    } else if (val.length != 11) {
      return "Please Enter valid PhoneNumber";
    } else if (int.parse(val[0]) != 0) {
      return "Please Enter valid PhoneNumber";
    } else {
      return null;
    }
  }

  static String? passwordValidate(String? val) {

    if (val == null) {
      return "please Enter Password";
    } else if (val.trim().isEmpty) {
      return "Please Enter Password";
    }  else {
      return null;
    }
  }
  static String? rePasswordValidate(String? val,String? password) {
    var regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    if (val != password) {
      return "please enter same Password";
    }
    else {
      return null;
    }
  }
}
