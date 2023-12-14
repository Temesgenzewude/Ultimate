import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../../common/constant/api_endpoints.dart';
import '../../../core/error/exception.dart';
import '../../../dependency_indjection.dart';
import '../../../sharedPreferences.dart';
import '../../models/account_info_model.dart';
import '../../models/authentication_model.dart';
import '../../models/login_request_model.dart';
import '../../models/login_response_model.dart';
import '../../models/save_user_interests_request_model.dart';
import '../../models/save_user_interests_response_model.dart';
import '../../models/social_login_request_model.dart';
import '../../models/social_login_response_model.dart';
import '../../models/user_sign_up_request_model.dart';

final prefManager = sl<PrefManager>();

abstract class AuthenticationRemoteDataSource {
  Future<SingUpResponseModel> signUpUserA(UserSignUpRequestModel newuser);
  Future<LoginResponseModel> signInUserA(UserALoginRequestModel user);
  Future<UserBSingUpResponse> signUpUserB(UserSignUpRequestModel newuser);
  Future<LoginResponseModel> signInUserB(UserBLoginRequestModel user);
  Future<List<dynamic>> uploadImagesA(List<XFile?> files);
  Future<List<dynamic>> uploadImagesB(List<XFile?> files);
  Future<AccInfoResponseModel> addAccountInfo(
      AccountInfoModel accountInfoModeladdAccountInfo);

  Future<AccInfoResponseModel> userBAddAccountInfo(
      AccountInfoModel accountInfoModel);

  Future<void> sendOtp();
  Future<LoginResponseModel> verifyOtp(String otp);
  Future<void> sendOTPUserA();
  Future<LoginResponseModel> verifyOTPUserA(String otp);

  Future<SocialLoginResponseModel> loginSocial(
      SocialLoginRequestModel socialLoginRequestModel);

  Future<SaveUserInterestsResponseModel> saveUserInterests(
      SaveUserInterestRequest userInterestRequest);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  AuthenticationRemoteDataSourceImpl({required this.client});
  final http.Client client;

  @override
  Future<LoginResponseModel> signInUserA(UserALoginRequestModel user) async {
    final String url = AppUrl.userASignInEndPoint;

    try {
      final jsonBody = json.encode(user.toJson());

      final response = await client.post(
        Uri.parse(url),
        body: jsonBody,
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 20));

      print('remote data source response status code: ${response.statusCode}');
      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);
        final jsonData = LoginResponseModel.fromJson(data);
        return jsonData;
      } else if (response.statusCode == 403) {
        final dynamic data = json.decode(response.body);
        throw ServerException(
            message: data['message'] ?? 'Invalid Email or password');
      } else {
        final dynamic data = json.decode(response.body);
        throw UnknownException(
            message: data['message'] ?? 'Error while trying to sign in');
      }
    } on SocketException catch (_) {
      throw const NoInternetException(message: 'No internet connection');
    } on TimeoutException catch (_) {
      throw const ConnectionTimeOutException(message: 'Connection timed out');
    }
  }

  // This method is responsible for signing up User A.
  // It takes a UserAModel object as a parameter and returns a Future of SingUpResponseModel.
  // It sends a POST request to the user A sign up endpoint with the user's JSON body.
  // If the response status code is 200, it decodes the response body and returns a SingUpResponseModel.
  // If the response status code is 403, it throws a ServerException with the error message from the response body.
  // Otherwise, it throws an UnknownException with a default error message.
  // It also handles SocketException and TimeoutException by throwing appropriate exceptions.
  @override
  Future<SingUpResponseModel> signUpUserA(UserSignUpRequestModel user) async {
    final String url = AppUrl.userASignUpEndPoint;

    try {
      user.coordinates = '31.536267224296935, 74.32805961092151';

      final body = user.toJson();
      print('---- sign up user a body: $body');

      final response = await client.post(
        Uri.parse(url),
        body: json.encode(body),
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 20));

      print('--- sign u user a--- response body: ${response.body}');

      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);
        return SingUpResponseModel.fromJson(data);
      } else if (response.statusCode == 403) {
        final dynamic data = json.decode(response.body);
        throw ServerException(
            message: data['message'] ?? 'Failed to create a new user');
      } else {
        final dynamic data = json.decode(response.body);
        throw UnknownException(
            message: data['message'] ?? 'Error while trying to sign up');
      }
    } on SocketException catch (_) {
      throw const NoInternetException(message: 'No internet connection');
    } on TimeoutException catch (_) {
      throw const ConnectionTimeOutException(message: 'Connection timed out');
    }
  }

  @override
  Future<LoginResponseModel> signInUserB(UserBLoginRequestModel user) async {
    final jsonBody = json.encode(user.toJson());

    final String url = AppUrl.userBSignInEndPoint;

    print('user b sign in request body: $jsonBody');

    try {
      final body = user.toJson();
      final response = await client.post(
        Uri.parse(url),
        body: json.encode(body),
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 20));

      print(response.body);
      print('user b sign in response code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);
        final jsonData = LoginResponseModel.fromJson(data);
        return jsonData;
      } else if (response.statusCode == 403) {
        final dynamic data = json.decode(response.body);
        throw ServerException(
            message: data['message'] ?? 'Invalid Email or password');
      } else {
        final dynamic data = json.decode(response.body);
        throw UnknownException(
            message: data['message'] ?? 'Error while trying to sign in');
      }
    } on SocketException catch (_) {
      throw const NoInternetException(message: 'No internet connection');
    } on TimeoutException catch (_) {
      throw const ConnectionTimeOutException(message: 'Connection timed out');
    }
  }

  @override
  Future<UserBSingUpResponse> signUpUserB(UserSignUpRequestModel user) async {
    final String url = AppUrl.userBSignUpEndPoint;

    user.coordinates = '31.536267224296935, 74.32805961092151';

    try {
      final body = user.toJson();
      print('---- sign up user b body: $body');

      final response = await client.post(
        Uri.parse(url),
        body: json.encode(body),
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 20));

      print('--- sign u user b--- response body: ${response.body}');

      if (response.statusCode == 201) {
        final dynamic data = json.decode(response.body);
        return UserBSingUpResponse.fromJson(data);
      } else if (response.statusCode == 403) {
        final dynamic data = json.decode(response.body);
        throw ServerException(
            message: data['message'] ?? 'Failed to create a new user');
      } else {
        final dynamic data = json.decode(response.body);
        throw UnknownException(
            message: data['message'] ?? 'Error while trying to sign up');
      }
    } on SocketException catch (_) {
      throw const NoInternetException(message: 'No internet connection');
    } on TimeoutException catch (_) {
      throw const ConnectionTimeOutException(message: 'Connection timed out');
    }
  }

  @override
  Future<void> sendOtp() async {
    print('user b sending otp');
    print(prefManager.userID);
    print(prefManager.token);

    try {
      final jsonbody = {'id': '${prefManager.userID}'};
      final response = await client.post(Uri.parse(AppUrl.sendOTPEndPoint),
          body: jsonEncode(jsonbody),
          headers: {
            'Authorization': prefManager.token ?? prefManager.kTokenB,
            'Content-Type': 'application/json',
          }).timeout(const Duration(seconds: 20));

      if (response.statusCode == 200) {
        print('success');
      } else if (response.statusCode == 403) {
        final dynamic error = json.decode(response.body);
        throw ForbiddenResponseException(
            message: error['message'] ?? 'Failed to send Otp');
      } else {
        final dynamic error = json.decode(response.body);
        throw UnknownException(
            message: error['message'] ?? 'Failed to send Otp');
      }
    } on SocketException catch (_) {
      throw const NoInternetException(message: 'No internet connection');
    } on TimeoutException catch (_) {
      throw const ConnectionTimeOutException(message: 'Connection timed out');
    }
  }

  @override
  Future<LoginResponseModel> verifyOtp(String otp) async {
    print('verifying user b otp');
    print('otp: $otp');
    print(prefManager.userID);
    print(prefManager.token);
    print(prefManager.testToken);

    try {
      final jsonbody = {'id': prefManager.userID, 'otp': otp};
      final response = await client.post(Uri.parse(AppUrl.verifyOTPEndPoint),
          body: jsonEncode(jsonbody),
          headers: {
            'Authorization': prefManager.token ?? prefManager.kTokenB,
            'Content-Type': 'application/json',
          }).timeout(const Duration(seconds: 20));
      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);
        return LoginResponseModel.fromJson(data);
      } else if (response.statusCode == 403) {
        final dynamic error = json.decode(response.body);
        throw ForbiddenResponseException(
            message: error['message'] ?? 'Failed to verify Otp');
      } else {
        final dynamic error = json.decode(response.body);
        throw UnknownException(
            message: error['message'] ?? 'Failed to verify Otp');
      }
    } on SocketException catch (_) {
      throw const NoInternetException(message: 'No internet connection');
    } on TimeoutException catch (_) {
      throw const ConnectionTimeOutException(message: 'Connection timed out');
    }
  }

  Future<LoginResponseModel> verifyOTPUserA(String otp) async {
    print('verifying user a otp');
    print('otp: $otp');
    print(prefManager.userID);
    print(prefManager.token);
    print(prefManager.testToken);

    try {
      final jsonbody = {'id': prefManager.userID, 'otp': otp};
      final response = await client.post(Uri.parse(AppUrl.verifyOTPEndPointA),
          body: jsonEncode(jsonbody),
          headers: {
            'Authorization': prefManager.token ?? prefManager.kTokenA,
            'Content-Type': 'application/json',
          }).timeout(const Duration(seconds: 20));
      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);
        return LoginResponseModel.fromJson(data);
      } else if (response.statusCode == 403) {
        final dynamic error = json.decode(response.body);
        throw ForbiddenResponseException(
            message: error['message'] ?? 'Failed to verify Otp');
      } else {
        final dynamic error = json.decode(response.body);
        throw UnknownException(
            message: error['message'] ?? 'Failed to verify Otp');
      }
    } on SocketException catch (_) {
      throw const NoInternetException(message: 'No internet connection');
    } on TimeoutException catch (_) {
      throw const ConnectionTimeOutException(message: 'Connection timed out');
    }
  }

  Future<void> sendOTPUserA() async {
    print('sending otp user a');
    print(prefManager.userID);
    print(prefManager.token);

    try {
      final jsonbody = {'id': '${prefManager.userID}'};
      final response = await client.post(Uri.parse(AppUrl.sendOTPEndPointA),
          body: jsonEncode(jsonbody),
          headers: {
            'Authorization': prefManager.token ?? prefManager.kTokenA,
            'Content-Type': 'application/json',
          }).timeout(const Duration(seconds: 20));

      if (response.statusCode == 200) {
        print('success');
      } else if (response.statusCode == 403) {
        final dynamic error = json.decode(response.body);
        throw ForbiddenResponseException(
            message: error['message'] ?? 'Failed to send Otp');
      } else {
        final dynamic error = json.decode(response.body);
        throw UnknownException(
            message: error['message'] ?? 'Failed to send Otp');
      }
    } on SocketException catch (_) {
      throw const NoInternetException(message: 'No internet connection');
    } on TimeoutException catch (_) {
      throw const ConnectionTimeOutException(message: 'Connection timed out');
    }
  }

  @override
  Future<List<dynamic>> uploadImagesA(List<XFile?> files) async {
    print('here===========================');
    try {
      final uri = Uri.parse('${AppUrl.bulkUploadImagesA}${prefManager.userID}');
      final request = http.MultipartRequest('POST', uri);
      files.forEach((file) async {
        request.files
            .add(await http.MultipartFile.fromPath('images', file!.path));
      });
      request.headers['Authorization'] =
          prefManager.token ?? prefManager.kTokenA;
      final response =
          await request.send().timeout(const Duration(seconds: 20));
      final streamedResponse = await http.Response.fromStream(response);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(streamedResponse.body);
        final List<dynamic> returnedList = data['imageUrls'];
        final List<String> returedString = [];
        returnedList.forEach((dynamic element) {
          returedString.add(element.toString());
        });

        return returedString;
      } else if (response.statusCode == 403) {
        final dynamic error = json.decode(streamedResponse.body);
        throw ForbiddenResponseException(
            message: error['error'] ?? 'Image upload failed');
      } else if (response.statusCode == 400) {
        final dynamic error = json.decode(streamedResponse.body);
        throw ForbiddenResponseException(
            message: error['error'] ?? 'No images selected');
      } else {
        final dynamic error = json.decode(streamedResponse.body);
        throw UnknownException(
            message: error['error'] ?? 'Image upload failed');
      }
    } on SocketException catch (_) {
      throw const NoInternetException(message: 'No internet connection');
    } on TimeoutException catch (_) {
      throw const ConnectionTimeOutException(message: 'Connection timed out');
    }
  }

  @override
  Future<List<dynamic>> uploadImagesB(List<XFile?> files) async {
    try {
      final uri = Uri.parse('${AppUrl.bulkUploadImagesB}${prefManager.userID}');
      final request = http.MultipartRequest('POST', uri);
      files.forEach((file) async {
        request.files
            .add(await http.MultipartFile.fromPath('images', file!.path));
      });
      request.headers['Authorization'] =
          prefManager.token ?? prefManager.kTokenB;
      final response =
          await request.send().timeout(const Duration(seconds: 20));
      final streamedResponse = await http.Response.fromStream(response);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(streamedResponse.body);
        final List<dynamic> returnedList = data['imageUrls'];
        final List<String> returedString = [];
        returnedList.forEach((dynamic element) {
          returedString.add(element.toString());
        });

        return returedString;
      } else if (response.statusCode == 403) {
        final dynamic error = json.decode(streamedResponse.body);
        throw ForbiddenResponseException(
            message: error['error'] ?? 'Image upload failed');
      } else if (response.statusCode == 400) {
        final dynamic error = json.decode(streamedResponse.body);
        throw ForbiddenResponseException(
            message: error['error'] ?? 'No images selected');
      } else {
        final dynamic error = json.decode(streamedResponse.body);
        throw UnknownException(
            message: error['error'] ?? 'Image upload failed');
      }
    } on SocketException catch (_) {
      throw const NoInternetException(message: 'No internet connection');
    } on TimeoutException catch (_) {
      throw const ConnectionTimeOutException(message: 'Connection timed out');
    }
  }

  @override
  Future<SaveUserInterestsResponseModel> saveUserInterests(
      SaveUserInterestRequest userInterestRequest) async {
    String url = '';
    String token = '';
    if (prefManager.userType == 'User B') {
      url = AppUrl.storeUserBInterests;
      token = prefManager.token ?? prefManager.kTokenB;
    } else {
      url = AppUrl.storeUserAInterests;
      token = prefManager.token ?? prefManager.kTokenA;
    }

    String newUrl = '$url/${prefManager.userID}';

    print('saving user ${prefManager.userType} interest url: $newUrl');
    print('token: $token');
    print('body: ${userInterestRequest.toJson()}');
    print('user id: ${prefManager.userID}');
    try {
      final body = userInterestRequest.toJson();
      print('---- saving user ${prefManager.userType} interest body: $body');

      final response = await client.post(
        Uri.parse(newUrl),
        body: json.encode(body),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token,
        },
      ).timeout(const Duration(seconds: 20));

      print(
          '--- saving  user ${prefManager.userType}--- response body: ${response.body}');

      print('response status code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);
        return SaveUserInterestsResponseModel.fromJson(data);
      } else if (response.statusCode == 404) {
        final dynamic data = json.decode(response.body);
        throw ServerException(
            message: data['message'] ??
                data['error'] ??
                'Failed to save user interests');
      } else if (response.statusCode == 403) {
        final dynamic data = json.decode(response.body);
        throw ServerException(
            message: data['message'] ??
                data['error'] ??
                'Failed to save user interests');
      } else if (response.statusCode == 401) {
        final dynamic data = json.decode(response.body);
        throw ServerException(
            message: data['message'] ??
                data['error'] ??
                'Failed to save user interests');
      } else {
        final dynamic data = json.decode(response.body);
        throw UnknownException(
            message: data['message'] ??
                data['error'] ??
                'Error while trying to save user interests');
      }
    } on SocketException catch (_) {
      throw const NoInternetException(message: 'No internet connection');
    } on TimeoutException catch (_) {
      throw const ConnectionTimeOutException(message: 'Connection timed out');
    }
  }

  @override
  Future<SocialLoginResponseModel> loginSocial(
      SocialLoginRequestModel socialLoginRequestModel) async {
    final response = await client.post(
      Uri.parse(AppUrl.socialLoginEndPoint),
      body: jsonEncode(socialLoginRequestModel.toJson()),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body);
      return SocialLoginResponseModel.fromJson(data);
    } else if (response.statusCode == 403) {
      final dynamic error = json.decode(response.body);
      throw ForbiddenResponseException(
          message: error['message']); // Update the error message if desired
    } else {
      final dynamic data = json.decode(response.body);
      throw Exception(data['message'] ?? 'Social Login Failed!');
    }
  }

  @override
  Future<AccInfoResponseModel> addAccountInfo(
      AccountInfoModel accountInfoModel) async {
    String url = '';
    String token = '';
    if (prefManager.userType == 'User B') {
      url = AppUrl.saveUserBProfile;
      token = prefManager.token ?? prefManager.kTokenB;
    } else {
      url = AppUrl.saveUserAProfile;
      token = prefManager.token ?? prefManager.kTokenA;
    }

    // String newUrl = '$url/${prefManager.userID}';

    print('saving user ${prefManager.userType} profile url: $url');
    print('token: $token');
    print('body: ${accountInfoModel.toJson()}');
    print('user id: ${prefManager.userID}');
    try {
      // final tempAccountInfoModel = AccountInfoModel(
      //   gender: accountInfoModel.gender,
      //   age: accountInfoModel.age,
      //   profession: accountInfoModel.profession,
      //   about: 'I am test',
      //   address: 'US',
      //   maritalStatus: 'Single',
      //   height: '188cm',
      //   lookingFor: 'Friend',
      //   child: '2',
      //   sect: 'Sunni',
      //   healthIssue: 'No',
      //   bornReligious: 'Born Muslim',
      //   isDrink: false,
      //   isSmoke: false,
      //   isMadication: false,
      //   ethnicity: 'Turkish',
      //   nationality: 'turkish',
      //   levelOfReligiously: 'Conservative',
      // );

      Map<String, dynamic> jsonBody = accountInfoModel.toJson();
      jsonBody['userId'] = '${prefManager.userID}';
      // jsonBody['userId'] = '654117b9ca01a37d7f8fe2e8';
      print('saving user profile request body $jsonBody');
      print(prefManager.token);

      final response = await client
          .post(Uri.parse(url), body: jsonEncode(jsonBody), headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final responseBody = AccInfoResponseModel.fromJson(jsonResponse);
        return responseBody;
      } else if (response.statusCode == 403 ||
          response.statusCode == 401 ||
          response.statusCode == 404) {
        final dynamic error = json.decode(response.body);
        throw ForbiddenResponseException(
            message: error['message'] ??
                ['error'] ??
                'Failed to save user profile!');
      } else {
        final dynamic error = json.decode(response.body);
        throw UnknownException(
            message: error['message'] ??
                ['error'] ??
                'Failed to save user profile!');
      }
    } on SocketException catch (_) {
      throw const NoInternetException(message: 'No internet connection');
    } on TimeoutException catch (_) {
      throw const ConnectionTimeOutException(message: 'Connection timed out');
    }
  }

  @override
  Future<AccInfoResponseModel> userBAddAccountInfo(
      AccountInfoModel accountInfoModel) async {
    try {
      Map<String, dynamic> jsonBody = accountInfoModel.toJson();
      jsonBody['userId'] = {'id': '${prefManager.userID}'};

      final response = await client.post(Uri.parse(AppUrl.saveUserBProfile),
          body: jsonEncode(jsonBody),
          headers: {
            'Authorization': prefManager.token ?? prefManager.kTokenB,
            'Content-Type': 'application/json',
          }).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final responseBody = AccInfoResponseModel.fromJson(jsonResponse);
        return responseBody;
      } else if (response.statusCode == 403) {
        final dynamic error = json.decode(response.body);
        throw ForbiddenResponseException(
            message: error['message'] ?? 'Failed to send Otp');
      } else {
        final dynamic error = json.decode(response.body);
        throw UnknownException(
            message: error['message'] ?? 'Failed to send Otp');
      }
    } on SocketException catch (_) {
      throw const NoInternetException(message: 'No internet connection');
    } on TimeoutException catch (_) {
      throw const ConnectionTimeOutException(message: 'Connection timed out');
    }
  }
}
