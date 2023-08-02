import 'package:get/get.dart';

import '../../../../presentation/user_dashboard/controllers/user_dashboard_controller.dart';

class UserDashboardControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserDashboardController>(
      () => UserDashboardController(),
    );
  }
}
