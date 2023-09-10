// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_color_styles.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_text_styles.dart';
import 'package:sbakusara_presence_app/presentation/settings/controllers/settings_controller.dart';

class ChangePasswordUser extends GetView<SettingsController> {
  ChangePasswordUser({Key? key}) : super(key: key);

  @override
  final SettingsController controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColorStyle.bgColormain,
        leading: IconButton(
          onPressed: () {
            Get.back();

            controller.newPassC.clear();
            controller.confirmPassC.clear();
            controller.oldPassC.clear();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColorStyle.textColorblack,
          ),
        ),
        centerTitle: true,
        titleSpacing: 0,
        title: Text(
          'Change Password',
          style: AppTextStyle.appBarTitleStyle.copyWith(
            color: AppColorStyle.textColorblack,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            child: Form(
              key: controller.changePassKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // textformfield old password
                  GetBuilder<SettingsController>(
                    builder: (controller) => TextFormField(
                      controller: controller.oldPassC,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: controller.passwordObscureText,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () => controller.obscureTextStatus(),
                          icon: controller.passwordObscureText
                              ? const Iconify(Mdi.eye)
                              : const Iconify(Mdi.eye_outline),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        hintText: 'Masukkan password lama',
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  // textformfield new password
                  GetBuilder<SettingsController>(
                    builder: (controller) => TextFormField(
                      controller: controller.newPassC,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: controller.newPasswordObscureText,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () => controller.obscurenewPassStatus(),
                          icon: controller.newPasswordObscureText
                              ? const Iconify(Mdi.eye)
                              : const Iconify(Mdi.eye_outline),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        hintText: 'Masukkan password baru',
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  // textformfield password
                  GetBuilder<SettingsController>(
                    builder: (controller) => TextFormField(
                      controller: controller.confirmPassC,
                      textInputAction: TextInputAction.done,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: controller.validateObscureText,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        hintText: 'Konfirmasi password baru',
                        suffixIcon: IconButton(
                          onPressed: () => controller.obscureValidTextStatus(),
                          icon: controller.validateObscureText
                              ? const Iconify(Mdi.eye)
                              : const Iconify(Mdi.eye_outline),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 48,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: SizedBox(
                      width: Get.width,
                      height: 40,
                      child: GetBuilder<SettingsController>(
                        builder: (controller) {
                          if (controller.isLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return ElevatedButton(
                              onPressed: () async {
                                await controller.changePassword(
                                    controller.oldPassC.text,
                                    controller.newPassC.text,
                                    controller.confirmPassC.text);
                                controller.oldPassC.clear();
                                controller.newPassC.clear();
                                controller.confirmPassC.clear();
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColorStyle.primary500,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              child: Text(
                                'Change Password',
                                style: AppTextStyle.labelTextStyle,
                              ),
                            );
                          }
                        },
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
