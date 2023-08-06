import 'package:intl/intl.dart';

class AppConstant {
  AppConstant();

  static String baseUrl = 'http://13.212.189.5:8080/api/v1';

  // formatter
  /// date input formatter
  static String getFormattedDate() {
    var dateFormat = DateFormat('yyyy-MM-dd');
    return dateFormat.format(DateTime.now());
  }

  /// date input formatter
  static String getFormattedTime() {
    var dateFormat = DateFormat('HH:mm:ss');
    return dateFormat.format(DateTime.now());
  }

  /// date input formatter
  static String formatedDate(DateTime date) {
    var dateFormat = DateFormat.yMMMd();
    return dateFormat.format(date);
  }
}
