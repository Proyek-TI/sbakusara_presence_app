import 'package:get/get.dart';
import 'package:sbakusara_presence_app/data/models/home_model.dart';
import 'package:sbakusara_presence_app/data/services/api_service.dart';

class UserHomeController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    await getHomeWidget();
  }

  final apiServices = ApiServices();
  HomeModel homeWidget = HomeModel();

  /// get home check in n check out info
  Future<void> getHomeWidget() async {
    final response = await apiServices.getHomeWidget();
    homeWidget = response;
    update();
  }
}
