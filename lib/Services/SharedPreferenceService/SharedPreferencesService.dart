import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<void> setString(String key, String value) async {
    SharedPreferences prefs = await _prefs;
    prefs.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString(key);
  }

  static Future<bool> checkKey(String key) async {
    SharedPreferences prefs = await _prefs;
    return prefs.containsKey(key);
  }

  static Future<bool> remove(String key) async {
    SharedPreferences prefs = await _prefs;
    return prefs.remove(key);
  }

  static Future<void> clearLocalData() async {
    SharedPreferences prefs = await _prefs;
    await prefs.clear();
  }
}
