import 'package:get/get.dart';

import '../../../../presentation/user_settings/controllers/user_settings_controller.dart';

class UserSettingsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserSettingsController>(
      () => UserSettingsController(),
    );
  }
}
