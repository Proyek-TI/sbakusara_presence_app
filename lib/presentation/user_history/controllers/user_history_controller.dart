import 'package:get/get.dart';
import 'package:sbakusara_presence_app/data/models/presence_history_model.dart';
import 'package:sbakusara_presence_app/data/services/api_service.dart';

class UserHistoryController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getUserPresenceHistory();
  }

  final apiService = ApiServices();

  String selectedPeriod = "";

  List<PresenceModel> presenceHistory = [];

  /// get presence history
  Future<void> getUserPresenceHistory() async {
    final response = await apiService.getPresenceHistory(selectedPeriod);
    presenceHistory = response;
    update();
  }

  /// change period {daily, weekly, monthly}
  void changePeriod(String newSelectedPeriod) {
    selectedPeriod = newSelectedPeriod;
    update();
    getUserPresenceHistory();
  }
}
