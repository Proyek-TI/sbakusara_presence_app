import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // TextEditingController
  final TextEditingController unameC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  // Obscure Text
  bool passwordObscureText = true;

  /// change obscure text status
  void obscureTextStatus() {
    passwordObscureText = !passwordObscureText;
    update();
  }

  // Validator

  /// name validator
  String? validateUname(String? value) {
    if (value == null || value.isEmpty) {
      return "Username tidak boleh kosong";
    }
    if (value.length < 6) {
      return 'Minimal 6 karakter';
    }
    return null;
  }

  /// password validator
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password tidak boleh kosong";
    }
    if (value.length < 8) {
      return 'Minimal 8 karakter';
    }

    return null;
  }
}
