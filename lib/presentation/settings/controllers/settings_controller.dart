import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sbakusara_presence_app/data/services/api_service.dart';
import 'package:sbakusara_presence_app/infrastructure/navigation/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController {
  @override
  void onClose() {
    super.onClose();
    oldPassC.clear();
    newPassC.clear();
    confirmPassC.clear();
  }

  bool isLoading = false;

  final apiService = ApiServices();

  final GlobalKey<FormState> changePassKey = GlobalKey<FormState>();

  // TextEditingController
  final TextEditingController oldPassC = TextEditingController();
  final TextEditingController newPassC = TextEditingController();
  final TextEditingController confirmPassC = TextEditingController();

  // Obscure Text
  bool passwordObscureText = true;
  bool newPasswordObscureText = true;
  bool validateObscureText = true;

  /// change obscure text status
  void obscureTextStatus() {
    passwordObscureText = !passwordObscureText;
    update();
  }

  /// change obscure text status
  void obscurenewPassStatus() {
    newPasswordObscureText = !newPasswordObscureText;
    update();
  }

  /// change obscure text status
  void obscureValidTextStatus() {
    validateObscureText = !validateObscureText;
    update();
  }

  Future<void> logout() async {
    isLoading = true;
    update();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAllNamed(Routes.auth);
    isLoading = false;
    update();
  }

  Future<void> changePassword(
      String oldPass, String newPass, String confirmNewPass) async {
    isLoading = true;
    update();
    await apiService.userChangePassword(oldPass, newPass, confirmNewPass);
    isLoading = false;
    update();
  }
}
