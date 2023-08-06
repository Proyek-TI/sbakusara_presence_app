import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_color_styles.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_constants.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_text_styles.dart';
import 'package:sbakusara_presence_app/presentation/user_history/user_detail_history_screen.dart';

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
        actions: [
          GetBuilder<UserHistoryController>(
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
              onChanged: (value) {
                if (value != null) {
                  controller.changePeriod(value);
                }
              },
              underline: const SizedBox.shrink(),
              icon: const Icon(Icons.filter_list_rounded),
            ),
          ),
        ],
      ),
      body: GetBuilder<UserHistoryController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.presenceHistory.length,
              itemBuilder: (context, index) {
                final presence = controller.presenceHistory[index];
                return InkWell(
                  onTap: () {
                    Get.to(() => UserDetailPresence(
                          index: index,
                          presence: presence,
                        ));
                  },
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
                                onPressed: () async {
                                  controller.openMap(
                                      latitude:
                                          double.parse(presence.latitude!),
                                      longitude:
                                          double.parse(presence.longitude!),
                                      location:
                                          presence.location ?? 'Undefined');
                                },
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
