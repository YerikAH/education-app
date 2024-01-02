import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  void saveValue(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String> returnValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    return token.toString();
  }
}
