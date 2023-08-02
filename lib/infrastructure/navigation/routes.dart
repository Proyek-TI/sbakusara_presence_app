class Routes {
  static Future<String> get initialRoute async {
    return splash;
  }

  static const auth = '/auth';
  static const splash = '/splash';
  static const userDashboard = '/user-dashboard';
  static const userHistory = '/user-history';
  static const userHome = '/home';
  static const userSettings = '/user-settings';
  static const adminDashboard = '/admin-dashboard';
}
