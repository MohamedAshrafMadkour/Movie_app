import 'package:shared_preferences/shared_preferences.dart';

class PrefStorage {
  static late SharedPreferences _instance;
  static Future<void> initPrefStorage() async {
    _instance = await SharedPreferences.getInstance();
  }

  static void setBool(String key, bool value) {
    _instance.setBool(key, value);
  }

  static bool getBool(String key) {
    var value = _instance.getBool(key) ?? false;
    return value;
  }
}
