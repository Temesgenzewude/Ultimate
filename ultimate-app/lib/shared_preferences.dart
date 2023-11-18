import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  SharedPreferences preferences;
  PrefManager(this.preferences);
  String? getPhoneNumber() {
    return preferences.getString('phoneNumber');
  }

  set phoneNumber(String? value) =>
      preferences.setString('phoneNumber', value ?? "");
}
