import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_color_styles.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_text_styles.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 16),
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

                Text(
                  'Semangat pagi,kamu belum melakukan presensi pada hari ini',
                  style: AppTextStyle.subtitleTextStyle
                      .copyWith(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(
                  height: 36,
                ),

                SizedBox(
                  width: Get.width,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () async {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColorStyle.primary500,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text(
                      'Tap untuk presensi',
                      style: AppTextStyle.labelTextStyle,
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
