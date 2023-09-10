import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_color_styles.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_constants.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_text_styles.dart';
import 'package:sbakusara_presence_app/presentation/admin_history/admin_detail_history_presence.dart';

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
                  value: '',
                  child: Text('All'),
                ),
                DropdownMenuItem(
                  value: 'today',
                  child: Text('Today'),
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
              onChanged: (newValue) {
                if (newValue != null) {
                  controller.changePeriod(newValue);
                  controller.getPresenceHistory();
                }
              },
              underline: const SizedBox.shrink(),
              icon: const Icon(Icons.filter_list_rounded),
            ),
          ),
        ],
      ),
      body: GetBuilder<AdminHistoryController>(
        builder: (controller) {
          if (controller.presenceHistory == null) {
            return const Center(
              child: Text('Belum ada riwayat presensi'),
            );
          } else if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.presenceHistory!.length,
                itemBuilder: (context, index) {
                  final presence = controller.presenceHistory![index];

                  return InkWell(
                    onTap: () {
                      Get.to(
                        () => AdminDetailPresence(
                          index: index,
                          presence: presence,
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
                        border: Border.all(
                          color: presence.status == 0
                              ? AppColorStyle.success500
                              : AppColorStyle.dangerColor500,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 8,
                            offset: const Offset(
                                5, 5), // changes position of shadow
                          ),
                        ],
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
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        'NAME',
                                        style: AppTextStyle.helperinfoStyle,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        presence.user!.name!,
                                        maxLines: 1,
                                        overflow: TextOverflow.clip,
                                        style: AppTextStyle.infoinOutStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        presence.status == 0 ? 'IN' : 'OUT',
                                        style: AppTextStyle.helperinfoStyle,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        presence.time!,
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
                                    await controller.openMap(
                                      latitude:
                                          double.parse(presence.latitude!),
                                      longitude:
                                          double.parse(presence.longitude!),
                                      location: presence.location ??
                                          'Unknown Location',
                                    );
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
          }
        },
      ),
    );
  }
}
