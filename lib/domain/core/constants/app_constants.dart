import 'package:intl/intl.dart';

class AppConstant {
  AppConstant();

  static String baseUrl = 'http://13.212.189.5:8080/api/v1';

  // formatter
  /// date formatter
  static String formatDateddMMMyyyy(String dateStr) {
    DateTime date = DateFormat("dd-MM-yyyy").parse(dateStr);
    String formattedDate = DateFormat("yyyy-MMM-dd").format(date);
    return formattedDate;
  }
}
