import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:sbakusara_presence_app/data/models/employee_model.dart';
import 'package:sbakusara_presence_app/data/models/home_model.dart';
import 'package:sbakusara_presence_app/data/models/presence_history_model.dart';
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

  // ======================== EMPLOYEE ======================== //

  /// user create presence
  Future<void> createPresence(
    String latitude,
    String longitude,
    List url,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    try {
      String fileName = url[0].path.split('/').last;
      final formData = FormData.fromMap(
        {
          "date": AppConstant.getFormattedDate(),
          "time": AppConstant.getFormattedTime(),
          "latitude": latitude,
          "longitude": longitude,
          "url": [
            await MultipartFile.fromFile(url[0].path, filename: fileName),
            await MultipartFile.fromFile(url[1].path, filename: fileName),
          ],
        },
      );

      final request = await _dio.post(
        '/presents',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data'
          },
        ),
      );

      if (request.statusCode == 200) {
        Get.snackbar(
          'Berhasil melakukan presensi!',
          'Have a nice day ^-^',
          duration: const Duration(seconds: 5),
        );
        Get.offAllNamed(
          Routes.userHome,
        );
      } else {
        Get.snackbar('Error', 'Sesuatu terjadi');
      }
    } catch (e) {
      if (e.toString().contains(400.toString())) {
        Get.snackbar(
            'Gagal Melakukan Presensi!', 'Kamu sudah melakukan presensi');
        // Get.back();
        Get.offAllNamed(
          Routes.userDashboard,
        );
      } else {
        Get.snackbar('Error', 'An error occurred: $e');
      }
    }
  }

  /// get checkin n checkout info
  Future<HomeModel> getHomeWidget() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    try {
      final response = await _dio.get(
        '/presents/widget',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      final homeWidget = HomeModel.fromJson(response.data['data']);
      return homeWidget;
    } catch (e) {
      throw e.toString();
    }
  }

  /// get presence history for employee
  Future<List<PresenceModel>> getPresenceHistory(String period) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    try {
      final response = await _dio.get(
        '/presents/user',
        queryParameters: {'period': period},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      List<dynamic> data = response.data['data'];
      List<PresenceModel> presence =
          data.map((item) => PresenceModel.fromJson(item)).toList();

      return presence;
    } catch (e) {
      throw e.toString();
    }
  }

  // ======================== ADMIN ======================== //

  /// Get Employee List
  Future<List<EmployeeModel>> getEmployeeList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    try {
      final response = await _dio.get(
        '/admin/users',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      List<dynamic> data = response.data['data'];
      List<EmployeeModel> employee =
          data.map((item) => EmployeeModel.fromJson(item)).toList();

      return employee;
    } catch (e) {
      throw e.toString();
    }
  }
}
