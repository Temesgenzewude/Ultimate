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
  Future<SingUpResponseModel> signup(UserAModel newuser);
  Future<LoginResponseModel> signin(LoginRequestModel user);
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
  Future<LoginResponseModel> signin(LoginRequestModel user) async {
    final String url = AppUrl.signInEndPoint;
    final jsonBody = json.encode(user.toJson());

    print(" signing in user ${user.toJson()}");
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
  Future<SingUpResponseModel> signup(UserAModel user) async {
    final String url = AppUrl.signUpEndPoint;
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
    // final body = {
    //   "name": "test",
    //   "email": "khaliyiytidd10@gmail.com",
    //   "phoneNumber": "+903939560848",
    //   "birthDate": "10-10-2022",
    //   "password": "1234567890",
    //   "address": "Dr Imad ud din",
    //   "coordinates": "31.536267224296935,74.32805961092151",
    //   "user_type": "user",
    //   "terms": true
    // };

    // print("dummy body ${json.encode(body)}");
    // final jsonBody = json.encode(user.toJson());
    print(jsonEncode(body));

    final String bodyString = json.encode(user.toJson());

    final response = await client.post(
      Uri.parse(url),
      body: json.encode(body),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    print('sing up api status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body);
      return SingUpResponseModel.fromJson(data);
    } else if (response.statusCode == 403) {
      throw Exception("User already registered");
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
    } else {
      final dynamic data = json.decode(response.body);
      throw Exception(data['message'] ?? "Social Login Failed!");
    }
  }
}
