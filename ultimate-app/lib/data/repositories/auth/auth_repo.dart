

import 'package:flutter/foundation.dart';

import '../../../common/constant/api_endpoints.dart';
import '../../network/base_api_services.dart';
import '../../network/networkApiServices.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  /// SignIn Api Call
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.signInEndPoint, data);
      if (kDebugMode) {
        print(
            '*************************** ${AppUrl.signInEndPoint} ************************');
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// SignUp Api Call
  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.signUpEndPoint, data);
      if (kDebugMode) {
        print(
            '*************************** ${AppUrl.signUpEndPoint} ************************');
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// Send OTP Api Call
  Future<dynamic> sendOTPApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.sendOTPEndPoint, data);
      if (kDebugMode) {
        print(
            '*************************** ${AppUrl.sendOTPEndPoint} ************************');
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// verify OTP Api Call
  Future<dynamic> verifyOTPApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.verifyOTPEndPoint, data);
      if (kDebugMode) {
        print(
            '*************************** ${AppUrl.verifyOTPEndPoint} ************************');
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// update password Api Call
  Future<dynamic> socialLoginApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.socialLoginEndPoint, data);
      if (kDebugMode) {
        print(
            '*************************** ${AppUrl.socialLoginEndPoint} ************************');
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// send OTP By Phone Number Api Call
  Future<dynamic> sendOTPByPhoneNumberApiCall(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.sendOTPByPhoneNumberEndPoint, data);
      if (kDebugMode) {
        print(
            '*************************** ${AppUrl.sendOTPByPhoneNumberEndPoint} ************************');
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
