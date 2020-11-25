import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'database_keys.dart';

class DataBaseService {
  static final DataBaseService _instance = DataBaseService._internal();
  DataBaseService._internal();

  factory DataBaseService() {
    return _instance;
  }

  /// Get appBoxx
  Box get appBoxx => Hive.box(DbBox.APPBOX);

  /// Save user
  saveUser(user) async {
    return await appBoxx.put(DbKeys.userKey, user);
  }

  /// Start database ` startDatabase() `
  static Future<void> startDatabase() async {
    final path = await getApplicationDocumentsDirectory();
    Hive.init(path.path);
    // Hive.registerAdapter(WorkspaceAdapter());
    await Hive.openBox(DbBox.APPBOX);
  }

  /// Save any data
  storeData<T>(String key, T data) async {
    await appBoxx.put(key, data);
  }

  retriveData(String key) {
    return appBoxx.get(key);
  }

  getUser() {
    return appBoxx.get(DbKeys.userKey);
  }

  getMap() async {
    return appBoxx.toMap();
  }

  /// Save Token
  saveToken(tokenModel) async {
    return await appBoxx.put(DbKeys.tokenKey, tokenModel);
  }

  getToken() {
    return appBoxx.get(DbKeys.tokenKey);
  }

  Future<void> logOut() async {
    await appBoxx.put(DbKeys.tokenKey, null);
    await appBoxx.put(DbKeys.userKey, null);
  }
}
