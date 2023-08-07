import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_color_styles.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_text_styles.dart';

import 'controllers/admin_history_controller.dart';

class AdminHistoryScreen extends GetView<AdminHistoryController> {
  AdminHistoryScreen({Key? key}) : super(key: key);

  @override
  final AdminHistoryController controller = Get.put(AdminHistoryController());
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
          'Presence History',
          style: AppTextStyle.appBarTitleStyle.copyWith(
            color: AppColorStyle.textColorblack,
          ),
        ),
        actions: [
          GetBuilder<AdminHistoryController>(
            builder: (controller) => DropdownButton(
              padding: const EdgeInsets.only(right: 20),
              items: const [
                DropdownMenuItem(
                  value: '',
                  child: Text('All'),
                ),
                // DropdownMenuItem(
                //   value: 'daily',
                //   child: Text('daily'),
                // ),
                DropdownMenuItem(
                  value: 'monthly',
                  child: Text('monthly'),
                ),
              ],
              onChanged: (value) {},
              underline: const SizedBox.shrink(),
              icon: const Icon(Icons.filter_list_rounded),
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'AdminHistoryScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
