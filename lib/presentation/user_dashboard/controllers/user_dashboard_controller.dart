import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:sbakusara_presence_app/data/models/home_model.dart';
import 'package:sbakusara_presence_app/data/services/address_service.dart';
import 'package:sbakusara_presence_app/data/services/api_service.dart';
import 'package:sbakusara_presence_app/presentation/screens.dart';

class UserDashboardController extends GetxController {
  @override
  void onInit() async {
    super.onInit();

    await getHomeWidget();
    await getAddress();
  }

  @override
  void onReady() async {
    super.onReady();
    await getHomeWidget();
    await getAddress();
  }

  // =============== navbar controller =============== //
  int selectedIndex = 0;

  List<Widget> pages = [
    UserHomeScreen(),
    const UserHistoryScreen(),
    SettingsScreen(),
  ];

  void currentIndex(int index) {
    selectedIndex = index;
    update();
  }

  // ================================================= //

  final apiServices = ApiServices();
  final addressService = AddressService();
  HomeModel homeWidget = HomeModel();

  final coords = Coords(-6.707629, 108.4767248);
  String title = "Lokasi saya";

  /// get home check in n check out info
  Future<void> getHomeWidget() async {
    final response = await apiServices.getHomeWidget();
    homeWidget = response;
    update();
  }

  /// open map and show location
  Future<void> openMap() async {
    final availableMaps = await MapLauncher.installedMaps;
    await availableMaps.first.showMarker(
      coords: coords,
      title: title,
    );
  }

  /// get location name n other info
  Future<void> getAddress() async {
    final response =
        await addressService.getAddressFromLatLng(-6.707629, 108.4767248);
    title = response;
    update();
  }
}
