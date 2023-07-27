class Routes {
  static Future<String> get initialRoute async {
    return splash;
  }

  static const auth = '/auth';
  static const homeUser = '/home-user';
  static const splash = '/splash';
  static const homeAdmin = '/home-admin';
}
