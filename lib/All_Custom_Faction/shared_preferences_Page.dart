import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static Future<void> saveUserId(int? id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('userId', id ?? 0);
  }

  static Future<void> saveUsername(String? username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username ?? '');
  }

  static Future<void> saveEmail(String? email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email ?? '');
  }

  static Future<void> savePassword(String? password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (password != null) {
      await prefs.setString('password', password);
    } else {
      await prefs.remove('password');
    }
  }

  static Future<void> saveIsEmailVerified(bool? isEmailVerified) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isEmailVerified', isEmailVerified ?? false);
  }

  static Future<void> saveV(int? v) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('v', v ?? 0);
  }

  static Future<String> loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username') ?? '';
  }

  static Future<String> loadEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email') ?? '';
  }

  static Future<void> clearAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<void> testSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('testKey', true);

    bool? testValue = prefs.getBool('testKey');
    print('Test Value: $testValue');
  }

}
