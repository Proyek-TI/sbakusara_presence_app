import 'package:get/get.dart';

import '../../../../presentation/user_presence/controllers/user_presence_controller.dart';

class UserPresenceControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserPresenceController>(
      () => UserPresenceController(),
    );
  }
}
