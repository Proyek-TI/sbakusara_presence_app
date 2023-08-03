import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_color_styles.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_text_styles.dart';
import 'package:sbakusara_presence_app/infrastructure/navigation/routes.dart';

import 'controllers/user_home_controller.dart';

class UserHomeScreen extends GetView<UserHomeController> {
  UserHomeScreen({Key? key}) : super(key: key);

  @override
  final UserHomeController controller = Get.put(UserHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 18,
                ),

                // date
                Text(
                  DateFormat.yMMMd().format(
                    DateTime.now(),
                  ),
                  style: AppTextStyle.dateTextStyle,
                ),
                const SizedBox(
                  height: 18,
                ),

                // clock
                StreamBuilder(
                  stream: Stream.periodic(const Duration(seconds: 1)),
                  builder: (context, snapshot) => Text(
                    DateFormat.Hm().format(
                      DateTime.now(),
                    ),
                    style: AppTextStyle.clockTextStyle,
                  ),
                ),

                SizedBox(
                  height: Get.height * 0.06,
                ),

                GetBuilder<UserHomeController>(
                  builder: (controller) => Text(
                    controller.homeWidget.checkInLast == 'belum absen' &&
                            controller.homeWidget.checkOutLast == 'belum absen'
                        ? 'Semangat pagi,kamu belum melakukan presensi pada hari ini'
                        : 'Kamu sudah melakukan absen hari ini',
                    style: AppTextStyle.subtitleTextStyle
                        .copyWith(fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(
                  height: 24,
                ),

                GetBuilder<UserHomeController>(
                  builder: (controller) {
                    return controller.homeWidget.checkInLast == 'belum absen' &&
                            controller.homeWidget.checkOutLast == 'belum absen'
                        ? const SizedBox.shrink()
                        : Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          'IN',
                                          style: AppTextStyle.helperinfoStyle,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          controller.homeWidget.checkInLast
                                              .toString(),
                                          style: AppTextStyle
                                              .helperbodyHeadlineStyle
                                              .copyWith(
                                            color: AppColorStyle.primary500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          'OUT',
                                          style: AppTextStyle.helperinfoStyle,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          controller.homeWidget.checkOutLast
                                              .toString(),
                                          style: AppTextStyle
                                              .helperbodyHeadlineStyle
                                              .copyWith(
                                            color: AppColorStyle.primary500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                  },
                ),

                const SizedBox(
                  height: 36,
                ),

                // open map
                GetBuilder<UserHomeController>(
                  builder: (controller) {
                    return controller.homeWidget.checkInLast == 'belum absen'
                        ? const SizedBox.shrink()
                        : CircleAvatar(
                            radius: 16,
                            backgroundColor: AppColorStyle.primary100,
                            child: IconButton(
                              onPressed: () async {
                                await controller.openMap();
                              },
                              icon: const Icon(
                                Icons.location_on_sharp,
                                size: 16,
                              ),
                            ),
                          );
                  },
                ),

                const SizedBox(
                  height: 36,
                ),

                // show location info
                GetBuilder<UserHomeController>(
                  builder: (controller) {
                    return controller.homeWidget.checkInLast == 'belum absen'
                        ? const SizedBox.shrink()
                        : Text(controller.title);
                  },
                ),

                const SizedBox(
                  height: 36,
                ),

                GetBuilder<UserHomeController>(
                  builder: (controller) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      width: Get.width,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(Routes.userPresence);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColorStyle.primary500,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Text(
                          controller.homeWidget.checkInLast == 'belum absen' &&
                                  controller.homeWidget.checkOutLast ==
                                      'belum absen'
                              ? 'Tap untuk presensi'
                              : 'Tap untuk Check Out',
                          style: AppTextStyle.labelTextStyle,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
