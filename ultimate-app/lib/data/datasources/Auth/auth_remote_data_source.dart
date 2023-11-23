// ignore_for_file: prefer_single_quotes

import 'dart:convert';
import 'package:flutter_ultimate/data/app_exceptions.dart';
import 'package:flutter_ultimate/data/models/authentication_model.dart';
import 'package:flutter_ultimate/data/models/login_response_model.dart';
import 'package:flutter_ultimate/data/models/social_login_request_model.dart';
import 'package:flutter_ultimate/data/models/social_login_response_model.dart';
import 'package:flutter_ultimate/dependency_indjection.dart';
import 'package:flutter_ultimate/sharedPreferences.dart';
import 'package:http/http.dart' as http;

import '../../../common/constant/api_endpoints.dart';
import '../../models/login_request_model.dart';

final prefManager = sl<PrefManager>();

abstract class AuthenticationRemoteDataSource {
  Future<SingUpResponseModel> signUpUserA(UserAModel newuser);
  Future<LoginResponseModel> signInUserA(UserALoginRequestModel user);
  Future<SingUpResponseModel> signUpUserB(UserBModel newuser);
  Future<LoginResponseModel> signInUserB(UserBLoginRequestModel user);

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
    final jsonBody = json.encode(user.toJson());

    final String url = AppUrl.userASignInEndPoint;

    final response = await client.post(
      Uri.parse(url),
      body: jsonBody,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body);
      final jsonData = LoginResponseModel.fromJson(data);
      return jsonData;
    } else if (response.statusCode == 403) {
      throw Exception('Invalid Email or password');
    } else {
      throw Exception("Error while trying to sing in");
    }
  }

  @override
  Future<SingUpResponseModel> signUpUserA(UserAModel user) async {
    final String url = AppUrl.userASignUpEndPoint;
    final Map<String, dynamic> body = <String, dynamic>{
      "name": user.name,
      "email": user.email,
      "phoneNumber": user.phoneNumber,
      "birthDate": user.birthDate,
      "password": user.password,
      "address": user.address,
      "coordinates": "${prefManager.kLatitude}, ${prefManager.kLongitude}",
      "user_type": user.user_type,
      "terms": user.terms,
    };

    final response = await client.post(
      Uri.parse(url),
      body: json.encode(body),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body);
      return SingUpResponseModel.fromJson(data);
    } else if (response.statusCode == 403) {
      final dynamic error = json.decode(response.body);
      throw ForbiddenResponseException(error);
    } else {
      throw Exception('Failed to create a new user');
    }
  }

  @override
  Future<LoginResponseModel> signInUserB(UserBLoginRequestModel user) async {
    final jsonBody = json.encode(user.toJson());

    final String url = AppUrl.userBSignInEndPoint;

    final response = await client.post(
      Uri.parse(url),
      body: jsonBody,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body);
      final jsonData = LoginResponseModel.fromJson(data);
      return jsonData;
    } else if (response.statusCode == 403) {
      final dynamic error = json.decode(response.body);
      throw ForbiddenResponseException(
          error['message']); // Update the error message if desired
    } else {
      throw Exception("Error while trying to sing in");
    }
  }

  @override
  Future<SingUpResponseModel> signUpUserB(UserBModel user) async {
    final String url = AppUrl.userBSignUpEndPoint;
    final Map<String, dynamic> body = <String, dynamic>{
      "name": user.name,
      "email": user.email,
      "phoneNumber": user.phoneNumber,
      "birthDate": user.birthDate,
      "password": user.password,
      "about": user.about,
      "coordinates": "${prefManager.kLatitude}, ${prefManager.kLongitude}",
      "age": user.age,
      "terms": user.terms,
      "gender": user.gender,
    };

    final response = await client.post(
      Uri.parse(url),
      body: json.encode(body),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body);
      return SingUpResponseModel.fromJson(data);
    } else if (response.statusCode == 403) {
      final dynamic error = json.decode(response.body);
      throw ForbiddenResponseException(
          error['message']); // Update the error message if desired
    } else {
      throw Exception('Failed to create a new user');
    }
  }

  @override
  Future<void> sendOtp() async {
    print('here');
    print(prefManager.kUserID);
    print(prefManager.kToken);

    final jsonbody = {'id': '${prefManager.kUserID}'};
    final response = await client.post(Uri.parse(AppUrl.sendOTPEndPoint),
        body: jsonEncode(jsonbody),
        headers: {
          'Authorization': prefManager.kToken,
          'Content-Type': 'application/json',
        });

    if (response.statusCode == 200) {
      print('success');
    } else {
      throw FetchDataException('Failed to send Otp');
    }
  }

  @override
  Future<void> verifyOtp(String otp) async {
    final jsonbody = {'id': prefManager.kUserID, 'otp': otp};
    final response = await client.post(Uri.parse(AppUrl.verifyOTPEndPoint),
        body: jsonEncode(jsonbody),
        headers: {
          'Authorization': '${prefManager.kToken}',
          'Content-Type': 'application/json',
        });
    if (response.statusCode == 200) {
    } else if (response.statusCode == 403) {
      final dynamic error = json.decode(response.body);
      throw ForbiddenResponseException(
          error['message']); // Update the error message if desired
    } else {
      throw FetchDataException('Failed to verify Otp');
    }
  }

  Future<void> verifyOTPUserA(String otp) async {
    final jsonbody = {'id': prefManager.kUserID, 'otp': otp};
    final response = await client.post(Uri.parse(AppUrl.verifyOTPEndPointA),
        body: jsonEncode(jsonbody),
        headers: {
          'Authorization': '${prefManager.kToken}',
          'Content-Type': 'application/json',
        });
    if (response.statusCode == 200) {
    } else if (response.statusCode == 403) {
      final dynamic error = json.decode(response.body);
      throw ForbiddenResponseException(
          error['message']); // Update the error message if desired
    } else {
      throw FetchDataException('Failed to verify Otp');
    }
  }

  Future<void> sendOTPUserA() async {
    final jsonbody = {'id': '${prefManager.kUserID}'};
    final response = await client.post(Uri.parse(AppUrl.sendOTPEndPointA),
        body: jsonEncode(jsonbody),
        headers: {
          'Authorization': prefManager.kToken,
          'Content-Type': 'application/json',
        });

    if (response.statusCode == 200) {
      print('success');
    } else if (response.statusCode == 403) {
      final dynamic error = json.decode(response.body);
      throw ForbiddenResponseException(
          error['message']); // Update the error message if desired
    } else {
      throw FetchDataException('Failed to send Otp');
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
          error['message']); // Update the error message if desired
    } else {
      final dynamic data = json.decode(response.body);
      throw Exception(data['message'] ?? "Social Login Failed!");
    }
  }
}
