import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static SharedPreferences? preferences;
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveToken({required String token}) async {
    await _secureStorage.write(key: "token", value: token);
  }

  static Future<String?> getToken() async {
    return await _secureStorage.read(key: "token");
  }

  static Future<void> clear() async {
    await preferences?.clear();
  }

  // static Future<void> removeUserData() async {
  //   await preferences?.remove('token');
  //   await _secureStorage.delete(key: "token");
  //   await preferences!.remove("customerPhoneNumber");
  //   await preferences!.remove("customerFullName");
  // }

  static Future<void> saveFirstSetup({required bool isFirstSetup}) async {
    await preferences?.setBool("firstSetup", isFirstSetup);
  } //Hay chat gpt, why hot restart makes this value null?

  static bool? getFirstSetupValue() {
    return preferences?.getBool("firstSetup");
  }
}