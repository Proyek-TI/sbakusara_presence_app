import 'package:get/get.dart';

import '../../../../presentation/home_user/controllers/home_controller.dart';

class HomeUserControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeUserController>(
      () => HomeUserController(),
    );
  }
}
