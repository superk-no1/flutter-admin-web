import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static StorageHelper? _instance;

  StorageHelper._();

  static StorageHelper get instance {
    _instance ??= StorageHelper._();
    return _instance!;
  }

  late final SharedPreferences _pref;

  Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  Future<bool> setInt(String key, int value) async {
    return await _pref.setInt(key, value);
  }

  Future<bool> setStr(String key, String value) async {
    return await _pref.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  Future<bool> setList(String key, List<String> value) async {
    return await _pref.setStringList(key, value);
  }

  int getInt(String key) {
    return _pref.getInt(key) ?? 0;
  }

  String getStr(String key) {
    return _pref.getString(key) ?? '';
  }

  bool getBool(String key) {
    return _pref.getBool(key) ?? false;
  }

  List<String> getList(String key) {
    return _pref.getStringList(key) ?? [];
  }
}
