import 'package:flutter_ultimate/core/error/exception.dart';

import 'package:flutter_ultimate/data/datasources/Auth/auth_remote_data_source.dart';
import 'package:flutter_ultimate/data/models/account_info_model.dart';
import 'package:flutter_ultimate/data/models/authentication_model.dart';
import 'package:flutter_ultimate/data/models/login_response_model.dart';
import 'package:flutter_ultimate/data/models/save_user_interests_response_model.dart';
import 'package:flutter_ultimate/data/models/save_user_interests_request_model.dart';
import 'package:flutter_ultimate/dependency_indjection.dart';
import 'package:flutter_ultimate/sharedPreferences.dart';
import 'package:image_picker/image_picker.dart';
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
        final response = await remoteDataSource.signUpUserA(newUser);

        prefManager.userId = response.userId;
        //prefManager.kToken = response.token.toString();

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

  Future<LoginResponseModel> signInUserB(UserBLoginRequestModel user) async {
    // try {
    //   final prefManager = sl<PrefManager>();
    //   final response = await remoteDataSource.signInUserB(user);
    //   prefManager.kToken = response.token.toString();
    //   prefManager.kUserID = response.user?.userId.toString() ?? '';

    //   return response;
    // } catch (e) {
    //   throw Exception(e.toString().substring(10));
    // }

    if (await internetConnectionChecker.hasConnection) {
      try {
        final prefManager = sl<PrefManager>();
        final response = await remoteDataSource.signInUserB(user);

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

  Future<UserBSingUpResponse> signUpUserB(UserBModel newUser) async {
    // try {
    //   return await remoteDataSource.signUpUserB(newUser);
    // } catch (e) {
    //   throw Exception(e.toString().substring(10));
    // }

    if (await internetConnectionChecker.hasConnection) {
      try {
        final response = await remoteDataSource.signUpUserB(newUser);

        prefManager.userId = response.userId;
        //prefManager.kToken = response.token.toString();
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

  Future<void> sendOTP() async {
    // try {
    //   return await remoteDataSource.sendOtp();
    // } catch (e) {
    //   throw Exception('Sending OTP failed');
    // }

    print('sendOTP UserB');

    if (await internetConnectionChecker.hasConnection) {
      try {
        return await remoteDataSource.sendOtp();
      } on NoInternetException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        // throw NoInternetException(message: e.message);
      } on ConnectionTimeOutException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        // throw ConnectionTimeOutException(message: e.message);
      } on ForbiddenResponseException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        //throw ForbiddenResponseException(message: e.message);
      } on UnknownException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        //throw UnknownException(message: e.message);
      } on ServerException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        //throw ServerException(message: e.message);
      }
    } else {
      throw const NoInternetException(
          message:
              'No Internet Connection! Please check your internet connection and try again.');
    }
  }

  Future<LoginResponseModel> verifyOTPApi(String otp) async {
    // try {
    //   return await remoteDataSource.verifyOtp(otp);
    // } catch (e) {
    //   throw Exception('Verifying OTP failed');
    // }

    print('verifyOTP User B otp: $otp');

    if (await internetConnectionChecker.hasConnection) {
      try {
        final response = await remoteDataSource.verifyOtp(otp);
        final prefManager = sl<PrefManager>();
        prefManager.token = response.token.toString();
        //prefManager.kToken = response.token.toString();
        prefManager.userId = response.user?.userId.toString() ?? '';

        print('auth repo user token: ${prefManager.token}');
        print('auth repo user id: ${prefManager.userID}');
        return response;
      } on NoInternetException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        // throw NoInternetException(message: e.message);
      } on ConnectionTimeOutException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        // throw ConnectionTimeOutException(message: e.message);
      } on ForbiddenResponseException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        // throw ServerException(message: e.message);
      } on UnknownException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        //throw UnknownException(message: e.message);
      } on ServerException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        //throw ServerException(message: e.message);
      }
    } else {
      throw const NoInternetException(
          message:
              'No Internet Connection! Please check your internet connection and try again.');
    }
  }

  Future<void> sendOTPUserA() async {
    // try {
    //   return remoteDataSource.sendOTPUserA();
    // } catch (e) {
    //   throw Exception('Sending OTP failed');
    // }

    print('sendOTP UserA');

    if (await internetConnectionChecker.hasConnection) {
      try {
        return remoteDataSource.sendOTPUserA();
      } on NoInternetException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        // throw NoInternetException(message: e.message);
      } on ConnectionTimeOutException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        // throw ConnectionTimeOutException(message: e.message);
      } on ForbiddenResponseException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        // throw ServerException(message: e.message);
      } on UnknownException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        //throw UnknownException(message: e.message);
      } on ServerException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        //throw ServerException(message: e.message);
      }
    } else {
      throw const NoInternetException(
          message:
              'No Internet Connection! Please check your internet connection and try again.');
    }
  }

  Future<LoginResponseModel> verifyOTPUserA(String otp) async {
    // try {
    //   return remoteDataSource.verifyOTPUserA(otp);
    // } catch (e) {
    //   throw Exception('Verifying OTP failed');
    // }

    print('verifyOTPUserA otp: $otp');

    if (await internetConnectionChecker.hasConnection) {
      try {
        final response = await remoteDataSource.verifyOTPUserA(otp);
        prefManager.token = response.token.toString();
        //prefManager.kToken = response.token.toString();
        prefManager.userId = response.user?.userId.toString() ?? '';

        print('auth repo user a token: ${prefManager.token}');
        print('auth repo user a id: ${prefManager.userID}');
        return response;
      } on NoInternetException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        // throw NoInternetException(message: e.message);
      } on ConnectionTimeOutException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        // throw ConnectionTimeOutException(message: e.message);
      } on ForbiddenResponseException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        // throw ServerException(message: e.message);
      } on UnknownException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        //throw UnknownException(message: e.message);
      } on ServerException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
      }
    } else {
      throw const NoInternetException(
          message:
              'No Internet Connection! Please check your internet connection and try again.');
    }
  }

  Future<List<dynamic>> uploadImagesA(List<XFile> files) async {
    // try {
    //   return remoteDataSource.verifyOTPUserA(otp);
    // } catch (e) {
    //   throw Exception('Verifying OTP failed');
    // }

    if (await internetConnectionChecker.hasConnection) {
      try {
        return remoteDataSource.uploadImagesA(files);
      } on NoInternetException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        // throw NoInternetException(message: e.message);
      } on ConnectionTimeOutException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        // throw ConnectionTimeOutException(message: e.message);
      } on ForbiddenResponseException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        // throw ServerException(message: e.message);
      } on UnknownException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        //throw UnknownException(message: e.message);
      } on ServerException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
      }
    } else {
      throw const NoInternetException(
          message:
              'No Internet Connection! Please check your internet connection and try again.');
    }
  }

  Future<List<dynamic>> uploadImagesB(List<XFile> files) async {
    // try {
    //   return remoteDataSource.verifyOTPUserA(otp);
    // } catch (e) {
    //   throw Exception('Verifying OTP failed');
    // }

    if (await internetConnectionChecker.hasConnection) {
      try {
        return remoteDataSource.uploadImagesB(files);
      } on NoInternetException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        // throw NoInternetException(message: e.message);
      } on ConnectionTimeOutException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        // throw ConnectionTimeOutException(message: e.message);
      } on ForbiddenResponseException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        // throw ServerException(message: e.message);
      } on UnknownException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        //throw UnknownException(message: e.message);
      } on ServerException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
      }
    } else {
      throw const NoInternetException(
          message:
              'No Internet Connection! Please check your internet connection and try again.');
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

  Future<AccInfoResponseModel> addAccountInfo(
      AccountInfoModel accountInfoModel) async {
    if (await internetConnectionChecker.hasConnection) {
      try {
        final response =
            await remoteDataSource.addAccountInfo(accountInfoModel);
        return response;
      } on NoInternetException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        // throw NoInternetException(message: e.message);
      } on ForbiddenResponseException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        // throw NoInternetException(message: e.message);
      } on ConnectionTimeOutException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        // throw ConnectionTimeOutException(message: e.message);
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

  Future<AccInfoResponseModel> userBAddAccountInfo(
      AccountInfoModel accountInfoModel) async {
    if (await internetConnectionChecker.hasConnection) {
      try {
        final response =
            await remoteDataSource.userBAddAccountInfo(accountInfoModel);
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

  Future<SaveUserInterestsResponseModel> saveUserInterests(
      SaveUserInterestRequest userInterestRequest) async {
    if (await internetConnectionChecker.hasConnection) {
      try {
        return remoteDataSource.saveUserInterests(userInterestRequest);
      } on NoInternetException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        //throw NoInternetException(message: e.message);
      } on ConnectionTimeOutException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        //throw ConnectionTimeOutException(message: e.message);
      } on ServerException catch (e) {
        print(' auth repo error: ${e.toString()}');
        rethrow;
        //throw ServerException(message: e.message);
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
}
