import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  late SharedPreferences _prefs;

  // Singleton pattern to ensure only one instance is created
  static final MySharedPreferences _instance = MySharedPreferences._internal();

  factory MySharedPreferences() {
    return _instance;
  }

  MySharedPreferences._internal();

  // Initialize SharedPreferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Get a string value from SharedPreferences
  String getString(String key, {String defaultValue = ''}) {
    return _prefs.getString(key) ?? defaultValue;
  }

  // Set a string value in SharedPreferences
  Future<bool> setString(String key, String value) {
    return _prefs.setString(key, value);
  }

  // Get an integer value from SharedPreferences
  int getInt(String key, {int defaultValue = 0}) {
    return _prefs.getInt(key) ?? defaultValue;
  }

  // Set an integer value in SharedPreferences
  Future<bool> setInt(String key, int value) {
    return _prefs.setInt(key, value);
  }

  // Get a boolean value from SharedPreferences
  bool getBool(String key, {bool defaultValue = false}) {
    return _prefs.getBool(key) ?? defaultValue;
  }

  // Set a boolean value in SharedPreferences
  Future<bool> setBool(String key, bool value) {
    return _prefs.setBool(key, value);
  }

  // Clear a value from SharedPreferences
  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }

  // Clear all values from SharedPreferences
  Future<bool> clear() {
    return _prefs.clear();
  }
}
