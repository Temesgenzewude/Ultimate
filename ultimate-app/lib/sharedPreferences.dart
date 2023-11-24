import 'package:flutter_ultimate/common/route/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  PrefManager(this.preferences);
  String kToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTYwODlhM2Y5MWE3NDczNDk0Y2RlYTEiLCJpYXQiOjE3MDA4NDE2OTV9.sFORF-J0JsEEYTC3oTtxd1ATiAnSjBkT4IU2TaZ-_sk';
  String kUserID = '';
  String kTokenA =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTU5ZWExMDNjNTM5OGQ4YWY1NGY4NzQiLCJpYXQiOjE3MDA4NTA5Nzl9.DNMRyqyuxqnrNYqCqYyAMGj7AkZx4gZZOp5D5RQBvOI';
  String kUserIDA = '';
  String kLatitude = 'latitude';
  String kLongitude = 'longitude';
  String kUserType = 'User B';
  String kName = 'name';
  String kEmail = 'email';
  String kPhone = 'phone';
  String kAddress = 'address';
  String kBirthday = 'birthday';
  String kPassword = 'password';
  String kTestToken = 'test_token';
  String kLastViewedPage = Routes.onBoarding1;
  SharedPreferences preferences;
  set token(String? value) => preferences.setString(kToken, value ?? '');
  String? get token => preferences.getString(kToken);
  set lastViewedPage(String? value) =>
      preferences.setString(kLastViewedPage, value ?? Routes.onBoarding1);
  String? get lastViewedPage => preferences.getString(kLastViewedPage);
  set userType(String? value) => preferences.setString(kUserType, value ?? '');
  String? get userType => preferences.getString(kUserType);
  set userId(String? value) => preferences.setString(kUserID, value ?? '');
  String? get userID => preferences.getString(kUserID);
  set latitude(String? value) => preferences.setString(kLatitude, value ?? '');
  String? get latitude => preferences.getString(kLatitude);
  set longitude(String? value) =>
      preferences.setString(kLongitude, value ?? '');
  String? get longitude => preferences.getString(kLongitude);
  void logout() => preferences.clear();

  set name(String? value) => preferences.setString(kName, value ?? '');
  String? get name => preferences.getString(kName);
  set email(String? value) => preferences.setString(kEmail, value ?? '');
  String? get email => preferences.getString(kEmail);
  set phone(String? value) => preferences.setString(kPhone, value ?? '');
  String? get phone => preferences.getString(kPhone);
  set address(String? value) => preferences.setString(kAddress, value ?? '');
  String? get address => preferences.getString(kAddress);
  set birthday(String? value) => preferences.setString(kBirthday, value ?? '');
  String? get birthday => preferences.getString(kBirthday);
  set password(String? value) => preferences.setString(kPassword, value ?? '');
  String? get password => preferences.getString(kPassword);

  set testToken(String? value) => preferences.setString(kTestToken,
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTQ0MjI3YTY3NjcxNWE3ZmZlZDk3NTMiLCJpYXQiOjE3MDAzNDAxNzZ9.DvWKBxMTWpRLxKjw-YDi_fJWUOLGmPCbhzzqNJzv550');
  String? get testToken => preferences.getString(kTestToken);
}
