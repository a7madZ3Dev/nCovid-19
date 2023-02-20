import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '/models/world_wide_api.dart';

class CacheHelper {
  SharedPreferences? sharedPref; /// i don't use it

  /// save them mode state
  static Future<void> saveDataWorldWide(
      {required WorldWideValues values}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final coronaData = json.encode(values.toJson());
    await sharedPreferences.setString('coronaData', coronaData);
  }

  /// get them mode state
  static Future<WorldWideValues> getDataWorldWide() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final value = json.decode(sharedPreferences.getString('coronaData')!)
        as Map<String, dynamic>;

    return WorldWideValues.fromJson(json: value);
  }
}
