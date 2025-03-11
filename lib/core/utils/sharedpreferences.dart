

import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static late SharedPreferences sharedPreference;

  static init() async {
    sharedPreference = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({required String key, required dynamic value}) {
    if (value is int) {
      return sharedPreference.setInt(key, value);
    } else if (value is double) {
      return sharedPreference.setDouble(key, value);
    } else if (value is String) {
      return sharedPreference.setString(key, value);
    } else if (value is bool) {
      return sharedPreference.setBool(key, value);
    }
    return Future.value(false);
  }

  static Future<bool> removeData ({required String key}){
    return sharedPreference.remove(key);
  }




  static Object? getDat({required String key}){
    return sharedPreference.get(key);
  }
}
