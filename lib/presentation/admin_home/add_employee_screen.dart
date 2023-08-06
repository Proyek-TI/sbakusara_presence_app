import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_color_styles.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_text_styles.dart';
import 'package:sbakusara_presence_app/presentation/admin_home/controllers/admin_home_controller.dart';

class AddEmployeeScreen extends StatelessWidget {
  AddEmployeeScreen({super.key});

  final AdminHomeController controller = Get.put(AdminHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColorStyle.bgColormain,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColorStyle.textColorblack,
          ),
        ),
        centerTitle: true,
        titleSpacing: 0,
        title: Text(
          'Add Employee',
          style: AppTextStyle.appBarTitleStyle.copyWith(
            color: AppColorStyle.textColorblack,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 55),
          child: Form(
            key: controller.addEmployeeFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                // textformfield name
                TextFormField(
                  controller: controller.nameC,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => controller.validateName(value),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    hintText: 'Masukkan Nama',
                  ),
                ),

                const SizedBox(
                  height: 24,
                ),

                // textformfield uname
                TextFormField(
                  controller: controller.unameC,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => controller.validateUname(value),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    hintText: 'Masukkan Username',
                  ),
                ),

                const SizedBox(
                  height: 24,
                ),

                // textformfield email
                TextFormField(
                  controller: controller.emailC,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => controller.validateEmail(value),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    hintText: 'Masukkan Email',
                  ),
                ),

                const SizedBox(
                  height: 24,
                ),

                // textformfield password
                GetBuilder<AdminHomeController>(
                  builder: (controller) => TextFormField(
                    controller: controller.passC,
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => controller.validateUname(value),
                    obscureText: controller.passwordObscureText,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      hintText: 'Masukkan password',
                      suffixIcon: IconButton(
                        onPressed: () => controller.obscureTextStatus(),
                        icon: controller.passwordObscureText
                            ? const Iconify(Mdi.eye)
                            : const Iconify(Mdi.eye_outline),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 64,
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: SizedBox(
                    width: Get.width,
                    height: 40,
                    child: GetBuilder<AdminHomeController>(
                      builder: (controller) => ElevatedButton(
                        onPressed: () async {
                          if (controller.addEmployeeFormKey.currentState!
                              .validate()) {
                            controller.addNewEmployee(
                                controller.nameC.text,
                                controller.unameC.text,
                                controller.emailC.text,
                                controller.passC.text);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColorStyle.primary500,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Text(
                          'Tambahkan Karyawan',
                          style: AppTextStyle.labelTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
