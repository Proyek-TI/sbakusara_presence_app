import 'package:get/get.dart';

import '../../../../presentation/admin_history/controllers/admin_history_controller.dart';

class AdminHistoryControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminHistoryController>(
      () => AdminHistoryController(),
    );
  }
}
