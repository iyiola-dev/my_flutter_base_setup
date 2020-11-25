class DbKeys {
  DbKeys._();

  /// indicates if this is the first time the app is opened
  static const String isFirstOpen = 'ISFIRSTOPEN';
  static const String isLoggedInKey = "ISLOGGEDIN";
  static const String userKey = "USER";
  static const String tokenKey = "TOKEN";
}

class DbBox {
  DbBox._();
  static const String APPBOX = 'APPNAME';
}
