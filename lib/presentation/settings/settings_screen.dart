import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_color_styles.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_text_styles.dart';
import 'package:sbakusara_presence_app/presentation/settings/change_user_password_screen.dart';

import 'controllers/settings_controller.dart';

class SettingsScreen extends GetView<SettingsController> {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  final SettingsController controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorStyle.bgColormain,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              ListTile(
                onTap: () {
                  Get.to(
                    () => ChangePasswordUser(),
                    transition: Transition.cupertino,
                  );
                },
                title: Text(
                  'Change Password',
                  style: AppTextStyle.tileTitleStyle,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                margin: const EdgeInsets.only(
                  bottom: 16,
                ),
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
                        onPressed: () {
                          controller.logout();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColorStyle.dangerColor500,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Text(
                          'Logout',
                          style: AppTextStyle.labelTextStyle,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
