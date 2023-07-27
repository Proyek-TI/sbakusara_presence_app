import 'package:get/get.dart';

import '../../../../presentation/splash/controllers/splash_controller.dart';

class SplashControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
  }
}
