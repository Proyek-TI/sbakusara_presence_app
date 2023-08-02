import 'package:get/get.dart';

import '../../../../presentation/user_history/controllers/user_history_controller.dart';

class UserHistoryControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserHistoryController>(
      () => UserHistoryController(),
    );
  }
}
