import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPref._();

  static SharedPref? _instance;
  static SharedPreferences? _preferences;

  static Future<SharedPref> getInstance() async {
    _instance ??= SharedPref._();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  // Generic Methods
  Future<bool> setString(String key, String value) async {
    return await _preferences!.setString(key, value);
  }

  String? getString(String key) {
    return _preferences!.getString(key);
  }

  Future<bool> setInt(String key, int value) async {
    return await _preferences!.setInt(key, value);
  }

  int? getInt(String key) {
    return _preferences!.getInt(key);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _preferences!.setBool(key, value);
  }

  bool? getBool(String key) {
    return _preferences!.getBool(key);
  }

  Future<bool> setDouble(String key, double value) async {
    return await _preferences!.setDouble(key, value);
  }

  double? getDouble(String key) {
    return _preferences!.getDouble(key);
  }

  Future<bool> setStringList(String key, List<String> value) async {
    return await _preferences!.setStringList(key, value);
  }

  List<String>? getStringList(String key) {
    return _preferences!.getStringList(key);
  }

  Future<bool> remove(String key) async {
    return await _preferences!.remove(key);
  }

  Future<bool> clear() async {
    return await _preferences!.clear();
  }

  bool containsKey(String key) {
    return _preferences!.containsKey(key);
  }

  // Specific Keys for common use cases
  static const String _keyUserToken = 'user_token';
  static const String _keyUserId = 'user_id';
  static const String _keyIsLoggedIn = 'is_logged_in';
  static const String _keyUserEmail = 'user_email';
  static const String _keyUserName = 'user_name';
  static const String _keyIsDarkTheme = 'dark_theme';

  // User Token Management
  Future<bool> saveUserToken(String token) async {
    return await setString(_keyUserToken, token);
  }

  String? getUserToken() {
    return getString(_keyUserToken);
  }

  Future<bool> removeUserToken() async {
    return await remove(_keyUserToken);
  }

  // Login State
  Future<bool> setLoggedIn(bool value) async {
    return await setBool(_keyIsLoggedIn, value);
  }

  bool isLoggedIn() {
    return getBool(_keyIsLoggedIn) ?? false;
  }

  // User ID
  Future<bool> saveUserId(String userId) async {
    return await setString(_keyUserId, userId);
  }

  String? getUserId() {
    return getString(_keyUserId);
  }

  // User Email
  Future<bool> saveUserEmail(String email) async {
    return await setString(_keyUserEmail, email);
  }

  String? getUserEmail() {
    return getString(_keyUserEmail);
  }

  // Dark Theme
  Future<bool> saveAppMode(bool isDark) async {
    return await setBool(_keyIsDarkTheme, isDark);
  }

  bool? getAppMode() {
    return getBool(_keyIsDarkTheme);
  }

  // User Name
  Future<bool> saveUserName(String name) async {
    return await setString(_keyUserName, name);
  }

  String? getUserName() {
    return getString(_keyUserName);
  }

  // Clear all user data
  Future<bool> clearUserData() async {
    await removeUserToken();
    await remove(_keyUserId);
    await remove(_keyUserEmail);
    await remove(_keyUserName);
    await setLoggedIn(false);
    await saveAppMode(false);
    return true;
  }
}
