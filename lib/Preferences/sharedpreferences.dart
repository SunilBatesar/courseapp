import 'package:shared_preferences/shared_preferences.dart';

class SPref {
  static String userIDKey = "userid";
  static late SharedPreferences _preferences;
  static getpref() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<dynamic> setSharedPrefs(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  static String getSharedPrefs(String key) {
    return _preferences.getString(key) ?? "";
  }

  static Future<dynamic> removSharedPrefs(String key) async {
    return await _preferences.remove(key);
  }
}
