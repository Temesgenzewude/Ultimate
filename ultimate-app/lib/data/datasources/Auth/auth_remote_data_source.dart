// ignore_for_file: prefer_single_quotes

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_ultimate/core/error/exception.dart';
import 'package:flutter_ultimate/data/models/authentication_model.dart';
import 'package:flutter_ultimate/data/models/login_response_model.dart';
import 'package:flutter_ultimate/data/models/social_login_request_model.dart';
import 'package:flutter_ultimate/data/models/social_login_response_model.dart';
import 'package:flutter_ultimate/dependency_indjection.dart';
import 'package:flutter_ultimate/sharedPreferences.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../../common/constant/api_endpoints.dart';
import '../../models/login_request_model.dart';

final prefManager = sl<PrefManager>();

abstract class AuthenticationRemoteDataSource {
  Future<SingUpResponseModel> signUpUserA(UserAModel newuser);
  Future<LoginResponseModel> signInUserA(UserALoginRequestModel user);
  Future<SingUpResponseModel> signUpUserB(UserBModel newuser);
  Future<LoginResponseModel> signInUserB(UserBLoginRequestModel user);
  Future<List<String>> uploadImages(List<XFile> files);

  Future<void> sendOtp();
  Future<void> verifyOtp(String otp);
  Future<void> sendOTPUserA();
  Future<void> verifyOTPUserA(String otp);

  Future<SocialLoginResponseModel> loginSocial(
      SocialLoginRequestModel socialLoginRequestModel);
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
      ).timeout(const Duration(seconds: 10));

      print('remote data source response status code: ${response.statusCode}');
      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);
        final jsonData = LoginResponseModel.fromJson(data);
        return jsonData;
      } else if (response.statusCode == 403) {
        final dynamic data = json.decode(response.body);
        throw ServerException(
            message: data["message"] ?? 'Invalid Email or password');
      } else {
        final dynamic data = json.decode(response.body);
        throw UnknownException(
            message: data["message"] ?? "Error while trying to sign in");
      }
    } on SocketException catch (_) {
      throw const NoInternetException(message: 'No internet connection');
    } on TimeoutException catch (_) {
      throw const ConnectionTimeOutException(message: 'Connection timed out');
    }
  }

  @override
  Future<SingUpResponseModel> signUpUserA(UserAModel user) async {
    final String url = AppUrl.userASignUpEndPoint;
    // final Map<String, dynamic> body = <String, dynamic>{
    //   "name": user.name,
    //   "email": user.email,
    //   "phoneNumber": user.phoneNumber,
    //   "birthDate": user.birthDate,
    //   "password": user.password,
    //   "address": user.address,
    //   "coordinates": "${prefManager.kLatitude}, ${prefManager.kLongitude}",
    //   "user_type": user.user_type,
    //   "terms": user.terms,
    // };
    user.coordinates = '31.536267224296935,74.32805961092151';

    // final body = user.toJson();
    // print('---- sign up user a body: $body');

    // final response = await client.post(
    //   Uri.parse(url),
    //   body: json.encode(body),
    //   headers: {
    //     'Content-Type': 'application/json',
    //   },
    // );

    // print('--- sign u user a--- response body: ${response.body}');

    // if (response.statusCode == 200) {
    //   final dynamic data = json.decode(response.body);
    //   return SingUpResponseModel.fromJson(data);
    // } else if (response.statusCode == 403) {
    //   final dynamic error = json.decode(response.body);
    //   throw ForbiddenResponseException(error);
    // } else {
    //   throw Exception('Failed to create a new user');
    // }

    try {
      final body = user.toJson();
      print('---- sign up user a body: $body');

      final response = await client.post(
        Uri.parse(url),
        body: json.encode(body),
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 10));

      print('--- sign u user a--- response body: ${response.body}');

      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);
        return SingUpResponseModel.fromJson(data);
      } else if (response.statusCode == 403) {
        final dynamic data = json.decode(response.body);
        throw ServerException(
            message: data["message"] ?? 'Failed to create a new user');
      } else {
        final dynamic data = json.decode(response.body);
        throw UnknownException(
            message: data["message"] ?? "Error while trying to sign up");
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

    print("user b sign in request body: $jsonBody");

    // final response = await client.post(
    //   Uri.parse(url),
    //   body: jsonBody,
    //   headers: {
    //     'Content-Type': 'application/json',
    //   },
    // );

    // print(response.body);
    // print("user b sign in response code: ${response.statusCode}");

    // if (response.statusCode == 200) {
    //   final dynamic data = json.decode(response.body);
    //   final jsonData = LoginResponseModel.fromJson(data);
    //   return jsonData;
    // } else if (response.statusCode == 403) {
    //   final dynamic error = json.decode(response.body);
    //   throw ForbiddenResponseException(
    //       error['message']); // Update the error message if desired
    // } else {
    //   throw Exception("Error while trying to sing in");
    // }

    try {
      final body = user.toJson();
      final response = await client.post(
        Uri.parse(url),
        body: json.encode(body),
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 10));

      print(response.body);
      print("user b sign in response code: ${response.statusCode}");

      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);
        final jsonData = LoginResponseModel.fromJson(data);
        return jsonData;
      } else if (response.statusCode == 403) {
        final dynamic data = json.decode(response.body);
        throw ServerException(
            message: data["message"] ?? 'Invalid Email or password');
      } else {
        final dynamic data = json.decode(response.body);
        throw UnknownException(
            message: data["message"] ?? "Error while trying to sign in");
      }
    } on SocketException catch (_) {
      throw const NoInternetException(message: 'No internet connection');
    } on TimeoutException catch (_) {
      throw const ConnectionTimeOutException(message: 'Connection timed out');
    }
  }

  @override
  Future<SingUpResponseModel> signUpUserB(UserBModel user) async {
    final String url = AppUrl.userBSignUpEndPoint;
    // final Map<String, dynamic> body = <String, dynamic>{
    //   "name": user.name,
    //   "email": user.email,
    //   "phoneNumber": user.phoneNumber,
    //   "birthDate": user.birthDate,
    //   "password": user.password,
    //   "about": user.about,
    //   "coordinates": "${prefManager.kLatitude}, ${prefManager.kLongitude}",
    //   "age": user.age,
    //   "terms": user.terms,
    //   "gender": user.gender,
    // };

    // final response = await client.post(
    //   Uri.parse(url),
    //   body: json.encode(body),
    //   headers: {
    //     'Content-Type': 'application/json',
    //   },
    // );

    // print(response.statusCode);

    // if (response.statusCode == 200) {
    //   final dynamic data = json.decode(response.body);
    //   return SingUpResponseModel.fromJson(data);
    // } else if (response.statusCode == 403) {
    //   final dynamic error = json.decode(response.body);
    //   throw ForbiddenResponseException(
    //       error['message']); // Update the error message if desired
    // } else {
    //   throw Exception('Failed to create a new user');
    // }

    user.location = '100.536267224296935,34.32805961092151';
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
        return SingUpResponseModel.fromJson(data);
      } else if (response.statusCode == 403) {
        final dynamic data = json.decode(response.body);
        throw ServerException(
            message: data["message"] ?? 'Failed to create a new user');
      } else {
        final dynamic data = json.decode(response.body);
        throw UnknownException(
            message: data["message"] ?? "Error while trying to sign up");
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

    // final jsonbody = {'id': '${prefManager.userID}'};
    // final response = await client.post(Uri.parse(AppUrl.sendOTPEndPoint),
    //     body: jsonEncode(jsonbody),
    //     headers: {
    //       'Authorization': prefManager.token??"",
    //       'Content-Type': 'application/json',
    //     });

    // if (response.statusCode == 200) {
    //   print('success');
    // } else {
    //   throw FetchDataException('Failed to send Otp');
    // }

    try {
      final jsonbody = {'id': '${prefManager.userID}'};
      final response = await client.post(Uri.parse(AppUrl.sendOTPEndPoint),
          body: jsonEncode(jsonbody),
          headers: {
            'Authorization': prefManager.token ?? '',
            'Content-Type': 'application/json',
          }).timeout(const Duration(seconds: 10));

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
  Future<void> verifyOtp(String otp) async {
    // final jsonbody = {'id': prefManager.kUserID, 'otp': otp};
    // final response = await client.post(Uri.parse(AppUrl.verifyOTPEndPoint),
    //     body: jsonEncode(jsonbody),
    //     headers: {
    //       'Authorization': '${prefManager.kToken}',
    //       'Content-Type': 'application/json',
    //     });
    // if (response.statusCode == 200) {
    // } else if (response.statusCode == 403) {
    //   final dynamic error = json.decode(response.body);
    //   throw ForbiddenResponseException(
    //       error['message']); // Update the error message if desired
    // } else {
    //   throw FetchDataException('Failed to verify Otp');
    // }

    try {
      final jsonbody = {'id': prefManager.userID, 'otp': otp};
      final response = await client.post(Uri.parse(AppUrl.verifyOTPEndPoint),
          body: jsonEncode(jsonbody),
          headers: {
            'Authorization': '${prefManager.kToken}',
            'Content-Type': 'application/json',
          }).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
      } else if (response.statusCode == 403) {
        final dynamic error = json.decode(response.body);
        throw ForbiddenResponseException(
            message: error['message'] ?? "Failed to verify Otp");
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

  Future<void> verifyOTPUserA(String otp) async {
    // final jsonbody = {'id': prefManager.kUserID, 'otp': otp};
    // final response = await client.post(Uri.parse(AppUrl.verifyOTPEndPointA),
    //     body: jsonEncode(jsonbody),
    //     headers: {
    //       'Authorization': '${prefManager.kToken}',
    //       'Content-Type': 'application/json',
    //     });
    // if (response.statusCode == 200) {
    // } else if (response.statusCode == 403) {
    //   final dynamic error = json.decode(response.body);
    //   throw ForbiddenResponseException(
    //       error['message']); // Update the error message if desired
    // } else {
    //   throw FetchDataException('Failed to verify Otp');
    // }

    try {
      final jsonbody = {'id': prefManager.userID, 'otp': otp};
      final response = await client.post(Uri.parse(AppUrl.verifyOTPEndPointA),
          body: jsonEncode(jsonbody),
          headers: {
            'Authorization': '${prefManager.kToken}',
            'Content-Type': 'application/json',
          }).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
      } else if (response.statusCode == 403) {
        final dynamic error = json.decode(response.body);
        throw ForbiddenResponseException(
            message: error['message'] ?? "Failed to verify Otp");
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
    // final jsonbody = {'id': '${prefManager.kUserID}'};
    // final response = await client.post(Uri.parse(AppUrl.sendOTPEndPointA),
    //     body: jsonEncode(jsonbody),
    //     headers: {
    //       'Authorization': prefManager.kToken,
    //       'Content-Type': 'application/json',
    //     });

    // if (response.statusCode == 200) {
    //   print('success');
    // } else if (response.statusCode == 403) {
    //   final dynamic error = json.decode(response.body);
    //   throw ForbiddenResponseException(
    //       error['message']); // Update the error message if desired
    // } else {
    //   throw FetchDataException('Failed to send Otp');
    // }

    try {
      final jsonbody = {'id': '${prefManager.userID}'};
      final response = await client.post(Uri.parse(AppUrl.sendOTPEndPointA),
          body: jsonEncode(jsonbody),
          headers: {
            'Authorization': prefManager.token ?? '',
            'Content-Type': 'application/json',
          }).timeout(const Duration(seconds: 10));

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

  Future<List<String>> uploadImages(List<XFile> files) async {
    try {
      final uri = Uri.parse('${AppUrl.bulkUploadImagesA}${prefManager.userID}');
      final request = http.MultipartRequest('POST', uri);
      files.forEach((file) async {
        request.files
            .add(await http.MultipartFile.fromPath('image', file.path));
      });
      final response = await request.send();
      final streamedResponse = await http.Response.fromStream(response);

      if (response.statusCode == 200) {
        final dynamic data = json.decode(streamedResponse.body);
        return data;
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
      throw Exception(data['message'] ?? "Social Login Failed!");
    }
  }
}
