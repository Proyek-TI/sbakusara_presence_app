class Routes {
  static Future<String> get initialRoute async {
    return splash;
  }

  static const adminDashboard = '/admin-dashboard';
  static const adminHome = '/admin-home';
  static const adminHistory = '/admin-history';
  static const auth = '/auth';
  static const splash = '/splash';
  static const userDashboard = '/user-dashboard';
  static const userHistory = '/user-history';
  static const userHome = '/home';
  static const userPresence = '/user-presence';
  static const userSettings = '/user-settings';
}
