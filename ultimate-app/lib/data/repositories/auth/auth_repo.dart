import 'package:flutter_ultimate/core/error/exception.dart';
import 'package:flutter_ultimate/data/datasources/Auth/auth_remote_data_source.dart';
import 'package:flutter_ultimate/data/models/authentication_model.dart';
import 'package:flutter_ultimate/data/models/login_response_model.dart';
import 'package:flutter_ultimate/dependency_indjection.dart';
import 'package:flutter_ultimate/sharedPreferences.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../models/login_request_model.dart';
import '../../models/social_login_request_model.dart';
import '../../models/social_login_response_model.dart';

class AuthenticationRepository {
  AuthenticationRepository({required this.remoteDataSource});
  final AuthenticationRemoteDataSource remoteDataSource;

  final InternetConnectionChecker internetConnectionChecker =
      InternetConnectionChecker();

  Future<LoginResponseModel> signInUserA(UserALoginRequestModel user) async {
    if (await internetConnectionChecker.hasConnection) {
      try {
        final prefManager = sl<PrefManager>();
        final response = await remoteDataSource.signInUserA(user);

        prefManager.token = response.token.toString();
        //prefManager.kToken = response.token.toString();
        prefManager.userId = response.user?.userId.toString() ?? '';

        print('auth repo user token: ${prefManager.token}');

        return response;
      } on NoInternetException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        // throw NoInternetException(message: e.message);
      } on ConnectionTimeOutException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        // throw ConnectionTimeOutException(message: e.message);
      } on ServerException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        // throw ServerException(message: e.message);
      } on UnknownException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        //throw UnknownException(message: e.message);
      }
    } else {
      throw const NoInternetException(
          message:
              'No Internet Connection! Please check your internet connection and try again.');
    }
  }

  Future<SingUpResponseModel> signUpUserA(UserAModel newUser) async {
    if (await internetConnectionChecker.hasConnection) {
      try {
        return await remoteDataSource.signUpUserA(newUser);
      } on NoInternetException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        // throw NoInternetException(message: e.message);
      } on ConnectionTimeOutException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        // throw ConnectionTimeOutException(message: e.message);
      } on ServerException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        // throw ServerException(message: e.message);
      } on UnknownException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        //throw UnknownException(message: e.message);
      }
    } else {
      throw const NoInternetException(
          message:
              'No Internet Connection! Please check your internet connection and try again.');
    }
  }

  Future<LoginResponseModel> signInUserB(UserBLoginRequestModel user) async {
    try {
      final prefManager = sl<PrefManager>();
      final response = await remoteDataSource.signInUserB(user);
      prefManager.kToken = response.token.toString();
      prefManager.kUserID = response.user?.userId.toString() ?? '';

      return response;
    } catch (e) {
      throw Exception(e.toString().substring(10));
    }
  }

  Future<SingUpResponseModel> signUpUserB(UserBModel newUser) async {
    try {
      return await remoteDataSource.signUpUserB(newUser);
    } catch (e) {
      throw Exception(e.toString().substring(10));
    }
  }

  Future<void> sendOTP() async {
    try {
      return await remoteDataSource.sendOtp();
    } catch (e) {
      throw Exception('Sending OTP failed');
    }
  }

  Future<void> verifyOTPApi(String otp) async {
    try {
      return await remoteDataSource.verifyOtp(otp);
    } catch (e) {
      throw Exception('Verifying OTP failed');
    }
  }

  Future<void> sendOTPUserA() {
    try {
      return remoteDataSource.sendOTPUserA();
    } catch (e) {
      throw Exception('Sending OTP failed');
    }
  }

  Future<void> verifyOTPUserA(String otp) {
    try {
      return remoteDataSource.verifyOTPUserA(otp);
    } catch (e) {
      throw Exception('Verifying OTP failed');
    }
  }

  Future<SocialLoginResponseModel> loginSocial(
      SocialLoginRequestModel socialLoginRequestModel) async {
    try {
      return await remoteDataSource.loginSocial(socialLoginRequestModel);
    } catch (e) {
      throw Exception(e.toString().substring(10));
    }
  }
}
