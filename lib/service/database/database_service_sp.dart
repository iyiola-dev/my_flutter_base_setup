import 'package:shared_preferences/shared_preferences.dart';

class DataBaseServiceSp {
  static final DataBaseServiceSp _instance = DataBaseServiceSp._internal();
  DataBaseServiceSp._internal();
  static SharedPreferences _sharedPreferences;

  factory DataBaseServiceSp() {
    return _instance;
  }

  static Future<SharedPreferences> initializeSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _sharedPreferences = prefs;
    return prefs;
  }

  // get db async {
  //   if (_sharedPreferences == null) {
  //     _sharedPreferences = await initializeSharedPreferences();
  //   }
  //   return _sharedPreferences;
  // }

  Future<void> logOut() async {
    return await _sharedPreferences.setBool("key", false);
  }
}
