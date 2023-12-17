// ignore: avoid_classes_with_only_static_members
class AppUrl {
  static var baseUrl = 'http://13.48.221.106:5001/api';
  //http://13.48.221.106:5001/api/save-profile-b

  static var userASignInEndPoint = '$baseUrl/signin'; // Endpoint for user A sign in
  static var userBSignInEndPoint = '$baseUrl/login-user'; // Endpoint for user B sign in
  static var userASignUpEndPoint = '$baseUrl/signup'; // Endpoint for user A sign up
  static var userBSignUpEndPoint = '$baseUrl/create-user'; // Endpoint for user B sign up
  static var sendOTPEndPoint = '$baseUrl/user-b-send-otp'; // Endpoint for sending OTP for user B
  static var verifyOTPEndPoint = '$baseUrl/user-b-verify-otp'; // Endpoint for verifying OTP for user B
  static var socialLoginEndPoint = '$baseUrl/login-with-social'; // Endpoint for social login
  static var sendOTPEndPointA = '$baseUrl/send-otp'; // Endpoint for sending OTP for user A
  static var verifyOTPEndPointA = '$baseUrl/verify-otp'; // Endpoint for verifying OTP for user A
  static var sendOTP = '$baseUrl/send-otp-by-phone-number'; // Endpoint for sending OTP by phone number
  static var bulkUploadImagesB = '$baseUrl/uploads-bulk-user-b/'; // Endpoint for bulk uploading images for user B
  static var bulkUploadImagesA = '$baseUrl/uploads-bulk/'; // Endpoint for bulk uploading images for user A
  static var saveUserBProfile = '$baseUrl/save-profile-b'; // Endpoint for saving user B profile
  static var saveUserAProfile = '$baseUrl/save-profile'; // Endpoint for saving user A profile
  static var storeUserBInterests = '$baseUrl/store-user-b-intrest'; // Endpoint for storing user B interests
  static var storeUserAInterests = '$baseUrl/store-user-intrest'; // Endpoint for storing user A interests
}
