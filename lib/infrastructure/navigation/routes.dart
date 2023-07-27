class Routes {
  static Future<String> get initialRoute async {
    return splash;
  }

  static const auth = '/auth';
  static const homeAdmin = '/home-admin';
  static const homeUser = '/home-user';
  static const splash = '/splash';
  static const dashboardUser = '/dashboard-user';
}
