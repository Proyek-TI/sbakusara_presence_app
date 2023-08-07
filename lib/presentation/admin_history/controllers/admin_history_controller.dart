import 'package:get/get.dart';
import 'package:sbakusara_presence_app/data/models/presence_history_model.dart';
import 'package:sbakusara_presence_app/data/services/api_service.dart';

class AdminHistoryController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getPresenceHistory();
  }

  final apiService = ApiServices();

  List<PresenceModel> presenceHistory = [];

  // filter data
  String selectedPeriod = "";

  Future<void> getPresenceHistory() async {
    final response = await apiService.getPresenceHistoryAdmin(selectedPeriod);
    presenceHistory = response;
    update();
  }

  void changePeriod(String newSelectedPeriod) {
    selectedPeriod = newSelectedPeriod;
    update(); 
    getPresenceHistory();
  }
}
