import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceClass {
  static String usernameKey = "USERNAMEKEY";
  static String passwordKey = "PASSWORD";
  static Future<bool> saveusername(String username) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(usernameKey, username);
  }

  static Future<bool> savepassword(String password) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(passwordKey, password);
  }

  static Future<String?> getusername() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(usernameKey);
  }

  static Future<String?> getpassword() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(passwordKey);
  }
}
