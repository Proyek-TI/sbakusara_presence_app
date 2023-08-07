import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_color_styles.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_constants.dart';
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
              padding: const EdgeInsets.only(top: 5, right: 20),
              items: const [
                DropdownMenuItem(
                  value: 'daily',
                  child: Text('Daily'),
                ),
                DropdownMenuItem(
                  value: 'weekly',
                  child: Text('Weekly'),
                ),
                DropdownMenuItem(
                  value: 'monthly',
                  child: Text('Monthly'),
                ),
              ],
              onChanged: (value) {},
              underline: const SizedBox.shrink(),
              icon: const Icon(Icons.filter_list_rounded),
            ),
          ),
        ],
      ),
      body: GetBuilder<AdminHistoryController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.presenceHistory.length,
              itemBuilder: (context, index) {
                final presence = controller.presenceHistory[index];
                return InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.only(
                        left: 12, right: 12, top: 12, bottom: 24),
                    decoration: BoxDecoration(
                      color: AppColorStyle.bgColormain,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppConstant.formatedDate(presence.date!),
                                style: AppTextStyle.dateTextStyle.copyWith(
                                  color: AppColorStyle.primary500,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'TIME',
                                      style: AppTextStyle.helperinfoStyle,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      presence.time!,
                                      style: AppTextStyle.infoinOutStyle,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'LOCATION',
                                      style: AppTextStyle.helperinfoStyle,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      presence.location ?? 'Undefined',
                                      style: AppTextStyle.infoinOutStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: AppColorStyle.primary100,
                              child: IconButton(
                                onPressed: () async {},
                                icon: const Icon(
                                  Icons.location_on_sharp,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
