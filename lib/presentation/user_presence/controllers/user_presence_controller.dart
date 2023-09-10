// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sbakusara_presence_app/data/models/home_model.dart';
import 'package:sbakusara_presence_app/data/services/api_service.dart';
import 'package:sbakusara_presence_app/data/services/location_service.dart';
import 'package:sbakusara_presence_app/domain/core/constants/app_color_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trust_location/trust_location.dart';

class UserPresenceController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    isUserMockLocation();
    await getUserLocation();
    // mockLocationStatus();
  }

  @override
  void onClose() async {
    super.onClose();
    await getHomeWidget();
    isUserMockLocation();
  }

  bool isLoading = false;

  HomeModel homeWidget = HomeModel();

  final apiService = ApiServices();
  final locationService = LocationService();

  double? latitude;
  double? longitude;
  bool? isMockLocation;

  List<XFile> selectedImages = [];
  List<File> willUploadedImages = [];

  /// pick multiple images from gallery
  Future<void> pickImages() async {
    final ImagePicker picker = ImagePicker();
    List<XFile>? pickedImages = await picker.pickMultiImage();
    if (pickedImages != null && pickedImages.isNotEmpty) {
      selectedImages.addAll(pickedImages);
      update();
    }
  }

  /// pick image from camera
  Future<void> selectImage() async {
    final ImagePicker imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 25,
    );
    if (pickedImage != null) {
      final imageFile = File(
        pickedImage.path,
      );
      willUploadedImages.add(imageFile);
      update();
    }
  }

  /// delete selected images
  void deleteImages(int index) {
    willUploadedImages.removeAt(index);

    update();
  }

  Future<void> isUserMockLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    TrustLocation.start(5);
    isMockLocation = await TrustLocation.isMockLocation;

    TrustLocation.onChange.listen(
      (values) {
        debugPrint(
            '${values.latitude} ${values.longitude} ${values.isMockLocation}');

        if (values.isMockLocation == true) {
          Get.dialog(
            barrierDismissible: false,
            AlertDialog(
              title: const Text(
                'Anda terdeteksi menggunakan FakeGPS',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    prefs.clear();
                    SystemNavigator.pop();
                  },
                  child: const Text(
                    'Mengerti',
                    style: TextStyle(color: AppColorStyle.primary500),
                  ),
                ),
              ],
            ),
          );

          update();
        } else {
          null;
        }
      },
    );

    update();
  }

  /// check user mock location
  Future<void> mockLocationStatus() async {
    if (isMockLocation == true) {
      // Get.dialog(
      //   AlertDialog(
      //     title: const Text(
      //       'Anda terdeteksi menggunakan FakeGPS',
      //     ),
      //     actions: [
      //       TextButton(
      //         onPressed: () {
      //           Get.offAll(
      //             SplashScreen(),
      //           );
      //         },
      //         child: const Text(
      //           'Mengerti',
      //           style: TextStyle(color: AppColorStyle.bgColormain),
      //         ),
      //       ),
      //     ],
      //   ),
      // );
      Get.snackbar(
        'Ayyo Beech',
        'Anda terdeteksi mau nuyul',
        duration: const Duration(
          seconds: 100,
        ),
      );
      update();
    } else {
      null;
    }
  }

  /// enable gps and get user location
  Future<void> getUserLocation() async {
    final location = await locationService.getUserLocation().then(
      (value) {
        if (value == null) {
          update();
        } else {
          return value;
        }
      },
    );

    if (location != null) {
      latitude = location.latitude;
      longitude = location.longitude;

      update();
    }
  }

  /// create presence
  Future<void> createPresence() async {
    isLoading = true;
    update();
    await apiService.createPresence(
        latitude.toString(), longitude.toString(), willUploadedImages);
    isLoading = false;
    update();
  }

  /// get home check in n check out info
  Future<void> getHomeWidget() async {
    final response = await apiService.getHomeWidget();
    homeWidget = response;
    update();
  }
}
