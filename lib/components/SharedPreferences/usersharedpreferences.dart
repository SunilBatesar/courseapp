import 'package:courses_app/main.dart';

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
