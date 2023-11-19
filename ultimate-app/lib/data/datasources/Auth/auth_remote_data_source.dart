// ignore_for_file: prefer_single_quotes

import 'dart:convert';
import 'package:flutter_ultimate/data/app_exceptions.dart';
import 'package:flutter_ultimate/data/models/authentication_model.dart';
import 'package:flutter_ultimate/data/models/login_response_model.dart';
import 'package:flutter_ultimate/dependency_indjection.dart';
import 'package:flutter_ultimate/sharedPreferences.dart';
import 'package:http/http.dart' as http;

import '../../../common/constant/api_endpoints.dart';
import '../../models/login_request_model.dart';

final prefManager = sl<PrefManager>();

abstract class AuthenticationRemoteDataSource {
  Future<SingUpResponseModel> signup(AuthenticationModel newuser);
  Future<LoginResponseModel> signin(LoginRequestModel user);
  Future<void> sendOtp(String id);
  Future<void> verifyOtp(String id, String otp);
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
      throw Exception(
          'Invalid Email or or ..'); // Update the error message if desired
    } else {
      throw Exception("Error while trying to sing in");
    }
  }

  @override
  Future<SingUpResponseModel> signup(AuthenticationModel user) async {
    final String url = AppUrl.signUpEndPoint;
    final jsonBody = json.encode(user.toJson());
    print(" signing up user ${user.toJson()}");
    final response = await client.post(
      Uri.parse(url),
      body: jsonBody,
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
  Future<void> sendOtp(String id) async {
    final response =
        await client.post(Uri.parse(AppUrl.verifyOTPEndPoint), body: {
      'id': id,
    }, headers: {
      'bearer': prefManager.kToken,
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
    } else {
      throw FetchDataException('Failed to send Otp');
    }
  }

  @override
  Future<void> verifyOtp(String id, String otp) async {
    final response =
        await client.post(Uri.parse(AppUrl.sendOTPEndPoint), body: {
      'id': id,
      'otp': otp
    }, headers: {
      'bearer': prefManager.kToken,
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
    } else {
      throw FetchDataException('Failed to verify Otp');
    }
  }
}
