import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_color_styles.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_text_styles.dart';
import 'package:sbakusara_presence_app/presentation/admin_home/employee_detail_screen.dart';

import 'controllers/admin_home_controller.dart';

class AdminHomeScreen extends GetView<AdminHomeController> {
  AdminHomeScreen({Key? key}) : super(key: key);

  @override
  final AdminHomeController controller = Get.put(AdminHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorStyle.bgColormain,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColorStyle.bgColormain,
        centerTitle: true,
        titleSpacing: 0,
        title: Text(
          'Daftar Karyawan',
          style: AppTextStyle.appBarTitleStyle.copyWith(
            color: AppColorStyle.textColorblack,
          ),
        ),
      ),
      body: GetBuilder<AdminHomeController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.employeeList.length,
              itemBuilder: (context, index) {
                final employee = controller.employeeList[index];
                return InkWell(
                  onTap: () {
                    Get.to(
                      () => EmployeeDetailScreen(
                        index: index,
                        employee: employee,
                      ),
                      transition: Transition.cupertino,
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.only(
                        left: 12, right: 12, top: 12, bottom: 24),
                    decoration: BoxDecoration(
                      color: AppColorStyle.bgColormain,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset:
                              const Offset(5, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          employee.name!,
                          style: AppTextStyle.bodyMediumStyle,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          employee.username!,
                          style: AppTextStyle.helperinfoStyle,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColorStyle.primary500,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(Icons.add_outlined),
      ),
    );
  }
}
