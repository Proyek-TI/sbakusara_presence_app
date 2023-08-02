import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/user_settings_controller.dart';

class UserSettingsScreen extends GetView<UserSettingsController> {
  UserSettingsScreen({Key? key}) : super(key: key);

  @override
  final UserSettingsController controller = Get.put(UserSettingsController());
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'UserSettingsScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
