import 'dart:convert';
import 'package:flutter_ultimate/data/app_exceptions.dart';
import 'package:flutter_ultimate/data/models/authentication_model.dart';
import 'package:http/http.dart' as http;

import '../../../common/constant/api_endpoints.dart';

abstract class AuthenticationRemoteDataSource {
  Future<AuthenticationModel> signup(AuthenticationModel newuser);
  Future<AuthenticationModel> signin(AuthenticationModel user);
  Future<void> sendOtp(String id, String phoneNumber);
  Future<void> verifyOtp(String id, String otp);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  AuthenticationRemoteDataSourceImpl({required this.client});
  final http.Client client;

  @override
  Future<AuthenticationModel> signin(AuthenticationModel user) async {
    
    final String url = AppUrl.signInEndPoint;
    final jsonBody = json.encode({
      'email': 'khalrr@gmail.com',
      'phoneNumber': '',
      'password': 'hazmed78',
    });

    final response = await client.post(
      Uri.parse(url),
      body: jsonBody,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body);
      final jsonData = AuthenticationModel.fromJson(data);
      return jsonData;
    } else {
      throw FetchDataException(
          'Failed to login'); // Update the error message if desired
    }
  }

  @override
  Future<AuthenticationModel> signup(AuthenticationModel user) async {
    final String url = AppUrl.signUpEndPoint;
    final jsonBody = json.encode({
      'name': 'khalid',
      'email': 'b686q2@gmail.com',
      'phoneNumber': '+2511786707099189',
      'birthDate': '21-10-2000',
      'password': '@Khalidmhd21',
      'address': 'Dr Imad ud din Yousaf Butt Neurologist - Lahore, Pakistan',
      'coordinates': '31.536267224296935, 74.32805961092151',
      'user_type': 'user',
      'terms': true
    });
    final response = await client.post(
      Uri.parse(url),
      body: jsonBody,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body);
      return AuthenticationModel.fromJson(data);
    } else if (response.statusCode == 403) {
      throw Exception("User already registered");
    } else {
      throw FetchDataException('Failed to create a new user');
    }
  }

  @override
  Future<void> sendOtp(String id, String phoneNumber) async {
    final response = await client
        .post(Uri.parse(AppUrl.sendOTPByPhoneNumberEndPoint), body: {
      'id': id,
      'phoneNumber': phoneNumber
    }, headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
    } else {
      throw FetchDataException('Failed to send Otp');
    }
  }

  @override
  Future<void> verifyOtp(String id, String otp) async {
    final response = await client
        .post(Uri.parse(AppUrl.sendOTPByPhoneNumberEndPoint), body: {
      'id': id,
      'otp': otp
    }, headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
    } else {
      throw FetchDataException('Failed to verify Otp');
    }
  }
}
