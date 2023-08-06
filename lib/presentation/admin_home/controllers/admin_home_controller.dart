import 'package:get/get.dart';
import 'package:sbakusara_presence_app/data/models/employee_model.dart';
import 'package:sbakusara_presence_app/data/services/api_service.dart';

class AdminHomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getEmployeeList();
  }

  final apiService = ApiServices();

  List<EmployeeModel> employeeList = [];

  /// get employee list
  Future<void> getEmployeeList() async {
    final response = await apiService.getEmployeeList();
    employeeList = response;
    update();
  }
}
