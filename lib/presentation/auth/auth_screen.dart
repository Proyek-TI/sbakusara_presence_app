import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_color_styles.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_text_styles.dart';

import 'controllers/auth_controller.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class AuthScreen extends GetView<AuthController> {
  AuthScreen({Key? key}) : super(key: key);

  @override
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            child: Form(
              key: controller.loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat datang!',
                    style: AppTextStyle.headTitleStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Silahkan masukan data informasi kamu yang sudah terdaftar',
                    style: AppTextStyle.headSubtitleStyle,
                  ),
                  const SizedBox(
                    height: 48,
                  ),

                  // textformfield username
                  TextFormField(
                    controller: controller.unameC,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => controller.validateUname(value),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      hintText: 'Masukkan username',
                    ),
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  // textformfield password
                  GetBuilder<AuthController>(
                    builder: (controller) => TextFormField(
                      controller: controller.passC,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => controller.validateUname(value),
                      obscureText: controller.passwordObscureText,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        hintText: 'Masukkan password',
                        suffixIcon: IconButton(
                          onPressed: () => controller.obscureTextStatus(),
                          icon: controller.passwordObscureText
                              ? const Iconify(Mdi.eye)
                              : const Iconify(Mdi.eye_outline),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 48,
                  ),

                  SizedBox(
                    width: Get.width,
                    height: 40,
                    child: GetBuilder<AuthController>(
                      builder: (controller) => ElevatedButton(
                        onPressed: () async {
                          if (controller.loginFormKey.currentState!
                              .validate()) {
                            await controller.userLogin(
                                controller.unameC.text, controller.passC.text);
                            controller.unameC.clear();
                            controller.passC.clear();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColorStyle.primary500,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: AppTextStyle.labelTextStyle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
