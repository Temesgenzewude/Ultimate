import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  PrefManager(this.preferences);
  String kToken = 'token';
  String kUserID = 'userID';
  SharedPreferences preferences;
  set token(String? value) => preferences.setString(kToken, value ?? '');
  String? get token => preferences.getString(kToken);
  set userId(String? value) => preferences.setString(kUserID, value ?? '');
  String? get userID => preferences.getString(kUserID);
  void logout() => preferences.clear();
}
