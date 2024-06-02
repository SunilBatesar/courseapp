import 'package:courses_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  Future setuserSharedPrefs(String value) async {
    await sharedPrefs.setString("userid", value);
  }

  dynamic getuserSharedPrefs() {
    return sharedPrefs.getString("userid");
  }

  Future<void> removUserSharedPrefs() async {
    await sharedPrefs.remove("userid");
  }
}

class SPref {
  late SharedPreferences preferences;
  getpref() async {
    preferences = await SharedPreferences.getInstance();
  }

  dynamic getSharedPrefs(String key) {
    return sharedPrefs.getString(key);
  }
}
