import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sbakusara_presence_app/data/models/employee_model.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_color_styles.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_text_styles.dart';

class EmployeeDetailScreen extends StatelessWidget {
  const EmployeeDetailScreen({
    super.key,
    required this.index,
    required this.employee,
  });

  final int index;
  final EmployeeModel employee;

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
          'Employee Detail',
          style: AppTextStyle.appBarTitleStyle.copyWith(
            color: AppColorStyle.textColorblack,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informasi Pribadi',
              style: AppTextStyle.tileTitleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Nama Lengkap',
                    style: AppTextStyle.subtitleTextStyle,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    employee.name!,
                    style: AppTextStyle.subtitleTextStyle.copyWith(
                      color: AppColorStyle.textColorgrey,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Email',
                    style: AppTextStyle.subtitleTextStyle,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    employee.email!,
                    style: AppTextStyle.subtitleTextStyle.copyWith(
                      color: AppColorStyle.textColorgrey,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Username',
                    style: AppTextStyle.subtitleTextStyle,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    employee.username!,
                    style: AppTextStyle.subtitleTextStyle.copyWith(
                      color: AppColorStyle.textColorgrey,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
