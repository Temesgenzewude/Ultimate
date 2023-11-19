import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  PrefManager(this.preferences);
  String kToken = 'token';
  String kUserID = 'userID';
  String kLatitude = 'latitude';
  String kLongitude = 'longitude';
  SharedPreferences preferences;
  set token(String? value) => preferences.setString(kToken, value ?? '');
  String? get token => preferences.getString(kToken);
  set userId(String? value) => preferences.setString(kUserID, value ?? '');
  String? get userID => preferences.getString(kUserID);
  set latitude(String? value) => preferences.setString(kLatitude, value ?? '');
  String? get latitude => preferences.getString(kLatitude);
  set longitude(String? value) =>
      preferences.setString(kLongitude, value ?? '');
  String? get longitude => preferences.getString(kLongitude);
  void logout() => preferences.clear();
}
