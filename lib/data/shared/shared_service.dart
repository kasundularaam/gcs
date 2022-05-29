import 'package:shared_preferences/shared_preferences.dart';

class SharedServices {
  static const String nicKey = "nic";

  static Future<String> getNic() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String nic = preferences.getString(nicKey) ?? "";
    return nic;
  }

  static Future addUser({required String nic}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(nicKey, nic);
  }

  static Future removeUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(nicKey);
  }

  static Future<bool> isUserIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final String nic = preferences.getString(nicKey) ?? "";
    return nic.isNotEmpty;
  }
}
