import 'package:get/get.dart';
import 'package:sbakusara_presence_app/data/models/home_model.dart';
import 'package:sbakusara_presence_app/data/services/api_service.dart';
import 'package:map_launcher/map_launcher.dart';

class UserHomeController extends GetxController {
  @override
  void onInit() async {
    super.onInit();

    await getHomeWidget();
  }

  final apiServices = ApiServices();
  HomeModel homeWidget = HomeModel();

  final coords = Coords(-6.707629, 108.4767248);
  final title = "Lokasi saya";

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
}
