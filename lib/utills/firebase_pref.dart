import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  // save user id
  static Future<bool> saveUserId(String user_id) async {
    Prefs.removeUserId();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("user_id", user_id);
  }
// load user id
  static Future<String> loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("user_id");
    return token!;
  }
// remove user id
  static Future<bool> removeUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("user_id");
  }

  // Firebase Token
  static Future<bool> saveFCM(String fcmToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('fcm_token', fcmToken);
  }
// load token
  static Future<String> loadFCM() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('fcm_token');
    return token!;
  }
}
