import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_constants.dart';
import 'package:sbakusara_presence_app/infrastructure/navigation/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices {
  ApiServices();

  final _dio = Dio(
    BaseOptions(baseUrl: AppConstant.baseUrl),
  );

  /// user login
  Future<void> login(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map data = {'username': username, 'password': password};

    try {
      final request = await _dio.post('/users/login', data: data);

      if (request.statusCode == 200) {
        // get token
        prefs.setString(
          'token',
          request.data['data']['token'],
        );

        if (request.data['data']['role'] == 'isUser') {
          Get.snackbar('Berhasil login', 'Semoga harimu menyenangkan ^-^');
          Get.offAllNamed(Routes.userDashboard);
        } else if (request.data['data']['role'] == 'isAdmin') {
          Get.offAllNamed(Routes.adminDashboard);
        }
      } else {
        Get.snackbar('Error', 'Email/Kata sandi salah');
      }
    } catch (e) {
      if (e.toString().contains(401.toString())) {
        Get.snackbar('Gagal login!',
            'Username/Passwordmu salah, coba ingat-ingat lagi ya');
      } else {
        Get.snackbar('Error', 'An error occurred: $e');
      }
    }
  }
}
