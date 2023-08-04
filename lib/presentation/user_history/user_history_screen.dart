import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_color_styles.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_text_styles.dart';

import 'controllers/user_history_controller.dart';

class UserHistoryScreen extends GetView<UserHistoryController> {
  UserHistoryScreen({Key? key}) : super(key: key);
  @override
  final UserHistoryController controller = Get.put(UserHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorStyle.bgColorsecond,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColorStyle.bgColorsecond,
        centerTitle: true,
        titleSpacing: 0,
        title: Text(
          'Presensi',
          style: AppTextStyle.appBarTitleStyle.copyWith(
            color: AppColorStyle.textColorblack,
          ),
        ),
      ),
      // body: Expanded(
      //   child: GetBuilder<UserHistoryController>(
      //     builder: (controller) {
      //       return ListView.builder(
      //         shrinkWrap: true,
      //         itemBuilder: (context, index) {
      //           return null;
      //         },
      //       );
      //     },
      //   ),
      // ),
    );
  }
}
