import 'package:flutter_ultimate/common/route/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  PrefManager(this.preferences);
  String kTokenB =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTYwODlhM2Y5MWE3NDczNDk0Y2RlYTEiLCJpYXQiOjE3MDA4NDE2OTV9.sFORF-J0JsEEYTC3oTtxd1ATiAnSjBkT4IU2TaZ-_sk';
  final String _kUserID = '';
  final String _kToken = 'token';
  String kTokenA =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTU5ZWExMDNjNTM5OGQ4YWY1NGY4NzQiLCJpYXQiOjE3MDA4NTA5Nzl9.DNMRyqyuxqnrNYqCqYyAMGj7AkZx4gZZOp5D5RQBvOI';
  final String _kLatitude = 'latitude';
  final String _kLongitude = 'longitude';
  final String _kUserType = 'User B';
  final String _kName = 'name';
  final String _kEmail = 'email';
  final String _kPhone = 'phone';
  final String _kAddress = 'address';
  final String _kBirthday = 'birthday';
  final String _kPassword = 'password';
  final String _kTestToken = 'test_token';
  final String _kGender = 'gender';
  final String _kAge = 'age';
  final String _kProfession = 'profession';
  final String _kAbout = 'about';
  final String _kHight = 'hight';
  final String _kChild = 'child';
  final String _kBornReligious = 'bornReligious';
  final String _kHealthIssue = 'healthIssue';
  final String _kMaritalStatus = 'martialStatus';
  final String _kLevelOfReligiously = 'levelOfReligiously';
  final String _kIsSmoke = 'isSmoke';
  final String _kIsDrink = 'isDrink';
  final String _kIsMedication = 'isMedication';
  final String _kEthnicity = 'ethnicity';
  final String _kNationality = 'nationality';
  final String _kSect = 'sect';
  final String _kLookingFor = 'lookingFor';
  final String _kAddress2 = 'address2';
  final String _kAddress3 = 'address3';
  final String _kTown = 'town';
  final String _kState = 'state';
  final String _kCountry = 'country';
  final String _kPostCode = 'postCode';
  final String _userNotification = 'user_notification';
  final String _adminNotification = 'admin_notification';
  final String _feedNotification = 'news_notification';

  final String _kLastViewedPage = Routes.onBoarding1;
  SharedPreferences preferences;
  set token(String? value) => preferences.setString(_kToken, value ?? '');
  String? get token => preferences.getString(_kToken);
  set lastViewedPage(String? value) =>
      preferences.setString(_kLastViewedPage, value ?? Routes.onBoarding1);
  String? get lastViewedPage => preferences.getString(_kLastViewedPage);
  set userType(String? value) => preferences.setString(_kUserType, value ?? '');
  String? get userType => preferences.getString(_kUserType);
  set userId(String? value) => preferences.setString(_kUserID, value ?? '');
  String? get userID => preferences.getString(_kUserID);
  set latitude(String? value) => preferences.setString(_kLatitude, value ?? '');
  String? get latitude => preferences.getString(_kLatitude);
  set longitude(String? value) =>
      preferences.setString(_kLongitude, value ?? '');
  String? get longitude => preferences.getString(_kLongitude);
  void logout() => preferences.clear();

  set name(String? value) => preferences.setString(_kName, value ?? '');
  String? get name => preferences.getString(_kName);
  set email(String? value) => preferences.setString(_kEmail, value ?? '');
  String? get email => preferences.getString(_kEmail);
  set phone(String? value) => preferences.setString(_kPhone, value ?? '');
  String? get phone => preferences.getString(_kPhone);
  set address(String? value) => preferences.setString(_kAddress, value ?? '');
  String? get address => preferences.getString(_kAddress);
  set birthday(String? value) => preferences.setString(_kBirthday, value ?? '');
  String? get birthday => preferences.getString(_kBirthday);

  set password(String? value) => preferences.setString(_kPassword, value ?? '');
  String? get password => preferences.getString(_kPassword);

  set testToken(String? value) => preferences.setString(_kTestToken,
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTQ0MjI3YTY3NjcxNWE3ZmZlZDk3NTMiLCJpYXQiOjE3MDAzNDAxNzZ9.DvWKBxMTWpRLxKjw-YDi_fJWUOLGmPCbhzzqNJzv550');
  String? get testToken => preferences.getString(_kTestToken);

  set gender(String? value) => preferences.setString(_kGender, value ?? '');
  String? get gender => preferences.getString(_kGender);

  set age(String? value) => preferences.setString(_kAge, value ?? '');
  String? get age => preferences.getString(_kAge);

  set profession(String? value) =>
      preferences.setString(_kProfession, value ?? '');
  String? get profession => preferences.getString(_kProfession);

  set about(String? value) => preferences.setString(_kAbout, value ?? '');
  String? get about => preferences.getString(_kAbout);

  set hight(String? value) => preferences.setString(_kHight, value ?? '');
  String? get hight => preferences.getString(_kHight);

  set child(String? value) => preferences.setString(_kChild, value ?? '');
  String? get child => preferences.getString(_kChild);

  set bornReligious(String? value) =>
      preferences.setString(_kBornReligious, value ?? '');
  String? get bornReligious => preferences.getString(_kBornReligious);

  set healthIssue(String? value) =>
      preferences.setString(_kHealthIssue, value ?? '');
  String? get healthIssue => preferences.getString(_kHealthIssue);

  set maritalStatus(String? value) =>
      preferences.setString(_kMaritalStatus, value ?? '');
  String? get maritalStatus => preferences.getString(_kMaritalStatus);

  set levelOfReligiously(String? value) =>
      preferences.setString(_kLevelOfReligiously, value ?? '');
  String? get levelOfReligiously => preferences.getString(_kLevelOfReligiously);

  set isSmoke(bool? value) => preferences.setBool(_kIsSmoke, value ?? false);
  bool? get isSmoke => preferences.getBool(_kIsSmoke);

  set isDrink(bool? value) => preferences.setBool(_kIsDrink, value ?? false);
  bool? get isDrink => preferences.getBool(_kIsDrink);

  set isMedication(bool? value) =>
      preferences.setBool(_kIsMedication, value ?? false);
  bool? get isMedication => preferences.getBool(_kIsMedication);

  set ethnicity(String? value) =>
      preferences.setString(_kEthnicity, value ?? '');
  String? get ethnicity => preferences.getString(_kEthnicity);

  set nationality(String? value) =>
      preferences.setString(_kNationality, value ?? '');
  String? get nationality => preferences.getString(_kNationality);

  set sect(String? value) => preferences.setString(_kSect, value ?? '');
  String? get sect => preferences.getString(_kSect);

  set lookingFor(String? value) =>
      preferences.setString(_kLookingFor, value ?? '');

  String? get lookingFor => preferences.getString(_kLookingFor);

  set address2(String? value) => preferences.setString(_kAddress2, value ?? '');
  String? get address2 => preferences.getString(_kAddress2);

  set address3(String? value) => preferences.setString(_kAddress3, value ?? '');
  String? get address3 => preferences.getString(_kAddress3);

  set town(String? value) => preferences.setString(_kTown, value ?? '');
  String? get town => preferences.getString(_kTown);

  set state(String? value) => preferences.setString(_kState, value ?? '');
  String? get state => preferences.getString(_kState);

  set country(String? value) => preferences.setString(_kCountry, value ?? '');
  String? get country => preferences.getString(_kCountry);

  set postCode(String? value) => preferences.setString(_kPostCode, value ?? '');
  String? get postCode => preferences.getString(_kPostCode);

  // Settings

  // User Notification
  set userNotification(bool? value) =>
      preferences.setBool(_userNotification, value ?? true);
  bool? get userNotification => preferences.getBool(_userNotification);

  // feed Notification
  set feedNotification(bool? value) =>
      preferences.setBool(_feedNotification, value ?? true);
  bool? get feedNotification => preferences.getBool(_feedNotification);

  // Admin Notification
  set adminNotification(bool? value) =>
      preferences.setBool(_adminNotification, value ?? true);
  bool? get adminNotification => preferences.getBool(_adminNotification);
}
