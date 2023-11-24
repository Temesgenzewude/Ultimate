// ignore: avoid_classes_with_only_static_members
class AppUrl {
  static var baseUrl = 'http://13.48.221.106:5001/api/';

  static var userASignInEndPoint = '$baseUrl/signin';
  static var userBSignInEndPoint = '$baseUrl/login-user';
  static var userASignUpEndPoint = '$baseUrl/signup';
  static var userBSignUpEndPoint = '$baseUrl/create-user';
  static var sendOTPEndPoint = '$baseUrl/user-b-send-otp';
  static var verifyOTPEndPoint = '$baseUrl/user-b-verify-otp';
  static var socialLoginEndPoint = '$baseUrl/login-with-social';
  static var sendOTPEndPointA = '$baseUrl/send-otp';
  static var verifyOTPEndPointA = '$baseUrl/verify-otp';
  static var sendOTP = '$baseUrl/send-otp-by-phone-number';
  static var bulkUploadImagesB = '$baseUrl/uploads-bulk-user-b/';
  static var bulkUploadImagesA = '$baseUrl/uploads-bulk/';
  static var addAccountInfoUserA = '$baseUrl/save-profile-b';
}
