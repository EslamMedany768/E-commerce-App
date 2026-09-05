import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtils {
  static late SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({required String key, required dynamic value}) {
    if (value is bool) {
      return prefs.setBool(key, value);
    } else if (value is int) {
      return prefs.setInt(key, value);
    } else if (value is String) {
      return prefs.setString(key, value);
    }
    return prefs.setDouble(key, value);
  }

  static getData({required String key}) {
    return prefs.get(key);
  }

  static Future<bool> deleteData({required String key}) {
    return prefs.remove(key);
  }
}
