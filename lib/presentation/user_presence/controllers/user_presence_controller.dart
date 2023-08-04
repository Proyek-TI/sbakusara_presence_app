// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sbakusara_presence_app/data/models/home_model.dart';
import 'package:sbakusara_presence_app/data/services/api_service.dart';
import 'package:sbakusara_presence_app/data/services/location_service.dart';

class UserPresenceController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await getUserLocation();
    await getHomeWidget();
  }

  @override
  void onClose() async {
    super.onClose();
    await getUserLocation();
    await getHomeWidget();
  }

  HomeModel homeWidget = HomeModel();

  final apiService = ApiServices();
  final locationService = LocationService();

  double? latitude;
  double? longitude;

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
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
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
    selectedImages.removeAt(index);
    update();
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
    await apiService.createPresence(
        latitude.toString(), longitude.toString(), willUploadedImages);
    update();
    getHomeWidget();
  }

  /// get home check in n check out info
  Future<void> getHomeWidget() async {
    final response = await apiService.getHomeWidget();
    homeWidget = response;
    update();
  }
}
