import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sbakusara_presence_app/data/services/api_service.dart';

class AuthController extends GetxController {
  @override
  void onClose() {
    super.onClose();
    unameC.clear();
    passC.clear();
    unameC.dispose();
    passC.dispose();
  }

  bool isLoading = false;

  final apiService = ApiServices();

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
    if (value.length < 4) {
      return 'Minimal 4 karakter';
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

  ///login
  Future<void> userLogin(String username, String password) async {
    isLoading = true;
    update();
    await apiService.login(username, password);
    isLoading = false;
    update();
  }
}
