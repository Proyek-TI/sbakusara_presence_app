import 'package:get/get.dart';
import 'package:sbakusara_presence_app/infrastructure/navigation/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController {
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    update();
    Get.offAllNamed(Routes.auth);
  }
}
