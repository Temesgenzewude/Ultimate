// import 'package:flutter/foundation.dart';

// import '../../../common/constant/api_endpoints.dart';
// import '../../network/base_api_services.dart';
// import '../../network/networkApiServices.dart';

// class AuthRepository {
//   final BaseApiServices _apiServices = NetworkApiServices();

//   /// SignIn Api Call
//   Future<dynamic> loginApi(dynamic data) async {
//     try {
//       dynamic response =
//           await _apiServices.getPostApiResponse(AppUrl.signInEndPoint, data);
//       if (kDebugMode) {
//         print(
//             '*************************** ${AppUrl.signInEndPoint} ************************');
//       }
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   /// SignUp Api Call
//   Future<dynamic> registerApi(dynamic data) async {
//     try {
//       dynamic response =
//           await _apiServices.getPostApiResponse(AppUrl.signUpEndPoint, data);
//       if (kDebugMode) {
//         print(
//             '*************************** ${AppUrl.signUpEndPoint} ************************');
//       }
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   /// Send OTP Api Call
//   Future<dynamic> sendOTPApi(dynamic data) async {
//     try {
//       dynamic response =
//           await _apiServices.getPostApiResponse(AppUrl.sendOTPEndPoint, data);
//       if (kDebugMode) {
//         print(
//             '*************************** ${AppUrl.sendOTPEndPoint} ************************');
//       }

//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   /// verify OTP Api Call
//   Future<dynamic> verifyOTPApi(dynamic data) async {
//     try {
//       dynamic response =
//           await _apiServices.getPostApiResponse(AppUrl.verifyOTPEndPoint, data);
//       if (kDebugMode) {
//         print(
//             '*************************** ${AppUrl.verifyOTPEndPoint} ************************');
//       }

//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   /// update password Api Call
//   Future<dynamic> socialLoginApi(dynamic data) async {
//     try {
//       dynamic response = await _apiServices.getPostApiResponse(
//           AppUrl.socialLoginEndPoint, data);
//       if (kDebugMode) {
//         print(
//             '*************************** ${AppUrl.socialLoginEndPoint} ************************');
//       }

//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   /// send OTP By Phone Number Api Call
//   Future<dynamic> sendOTPByPhoneNumberApiCall(dynamic data) async {
//     try {
//       dynamic response = await _apiServices.getPostApiResponse(
//           AppUrl.sendOTPByPhoneNumberEndPoint, data);
//       if (kDebugMode) {
//         print(
//             '*************************** ${AppUrl.sendOTPByPhoneNumberEndPoint} ************************');
//       }

//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

import 'package:flutter_ultimate/data/datasources/Auth/auth_remote_data_source.dart';
import 'package:flutter_ultimate/data/models/authentication_model.dart';
import 'package:flutter_ultimate/data/models/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/login_request_model.dart';

class AuthenticationRepository {
  AuthenticationRepository({required this.remoteDataSource});
  final AuthenticationRemoteDataSource remoteDataSource;

  Future<LoginResponseModel> signin(LoginRequestModel user) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final response = await remoteDataSource.signin(user);

      print('...User Token...: ${response.token}');
      print('...User Id...: ${response.user?.userId}');

      prefs.setString('token', response.token.toString());
      prefs.setString('userId', response.user?.userId.toString() ?? '');

      return response;
    } catch (e) {
      throw Exception(e.toString().substring(10));
    }
  }

  Future<SingUpResponseModel> signup(AuthenticationModel newUser) async {
    try {
      return await remoteDataSource.signup(newUser);
    } catch (e) {
      throw Exception(e.toString().substring(10));
    }
  }

  Future<void> sendOTP() async {
    try {
      return await remoteDataSource.sendOtp();
    } catch (e) {
      throw Exception("Sending OTP failed");
    }
  }

  Future<void> verifyOTPApi(String otp) async {
    try {
      return await remoteDataSource.verifyOtp(otp);
    } catch (e) {
      throw Exception("Verifying OTP failed");
    }
  }
}
