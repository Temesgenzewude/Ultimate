// ignore: avoid_classes_with_only_static_members
class AppUrl {
  static var baseUrl = 'http://16.170.201.181:5001/api/';

  
  static var signInEndPoint = '$baseUrl/signin';
  static var signUpEndPoint = '$baseUrl/signup';
  static var sendOTPEndPoint = '$baseUrl/send-otp';
  static var verifyOTPEndPoint = '$baseUrl/verify-otp';
  static var socialLoginEndPoint = '$baseUrl/login-with-social';
  static var sendOTPByPhoneNumberEndPoint = '$baseUrl/send-otp-by-phone-number';
}
