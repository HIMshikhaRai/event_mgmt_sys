import 'package:shared_preferences/shared_preferences.dart';

const String isLoggedIn = "is_logged_in";

class SharedPrefHelper {
  static Future<SharedPreferences> get _instance async =>
      _prefInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefInstance;

  static Future<SharedPreferences> init() async {
    _prefInstance = await _instance;
    return _prefInstance!;
  }

  /// returns string value saved in shared preference
  Future<String> getStringValueFrmPref(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  /// returns integer value saved in shared preference
  Future<int> getIntValueFrmPref(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? -1;
  }

  /// returns boolean value saved in shared preference
  Future<bool> getBoolValueFrmPref(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  /// save string value to shared preference
  Future<void> setStringToPref(String key, String value) async {
    var prefs = await _instance;
    await prefs.setString(key, value);
  }

  /// save integer value to shared preference
  Future<void> setIntToPref(String key, int value) async {
    var prefs = await _instance;
    await prefs.setInt(key, value);
  }

  /// save boolean value to shared preference
  Future<void> setBoolToPref(String key, bool value) async {
    var prefs = await _instance;
    await prefs.setBool(key, value);
  }
}
