import 'package:flutter/material.dart';
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

  /// add employee
  final GlobalKey<FormState> addEmployeeFormKey = GlobalKey<FormState>();

  // TextEditingController
  final TextEditingController nameC = TextEditingController();
  final TextEditingController unameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  // Obscure Text
  bool passwordObscureText = true;

  /// change obscure text status
  void obscureTextStatus() {
    passwordObscureText = !passwordObscureText;
    update();
  }

  // Validator

  /// name validator
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Nama tidak boleh kosong";
    }
    if (value.length < 4) {
      return 'Minimal 4 karakter';
    }
    return null;
  }

  /// uname validator
  String? validateUname(String? value) {
    if (value == null || value.isEmpty) {
      return "Username tidak boleh kosong";
    }
    if (value.length < 4) {
      return 'Minimal 4 karakter';
    }
    return null;
  }

  /// email validator
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email tidak boleh kosong";
    }
    if (value.length < 4) {
      return 'Minimal 4 karakter';
    }
    return null;
  }

  /// password validator
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password tidak boleh kosong";
    }
    if (value.length < 8) {
      return 'Minimal 8 karakter';
    }

    return null;
  }

  /// add employee list
  Future<void> addNewEmployee(
    String name,
    String uname,
    String email,
    String password,
  ) async {
    await apiService.addEmployee(name, uname, email, password);
    update();
  }

  /// get employee list
  Future<void> getEmployeeList() async {
    final response = await apiService.getEmployeeList();
    employeeList = response;
    update();
  }
}
