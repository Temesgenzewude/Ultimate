import 'dart:convert';
import 'package:flutter_ultimate/data/app_exceptions.dart';
import 'package:flutter_ultimate/data/models/authentication_model.dart';
import 'package:http/http.dart' as http;

import '../../../common/constant/api_endpoints.dart';

abstract class AuthenticationRemoteDataSource {
  Future<AuthenticationModel> signup(AuthenticationModel newuser);
  Future<AuthenticationModel> signin(AuthenticationModel user);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  AuthenticationRemoteDataSourceImpl({required this.client});
  final http.Client client;

  @override
  Future<AuthenticationModel> signin(AuthenticationModel user) async {
    final String url = AppUrl.signInEndPoint;
    final response = await client.post(
      Uri.parse(url),
      body: user,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body);
      return AuthenticationModel.fromJson(data);
    } else {
      throw FetchDataException(
          'Failed to login'); // Update the error message if desired
    }
  }

  @override
   Future<AuthenticationModel> signup(AuthenticationModel user) async {
    final String url = AppUrl.signUpEndPoint;
    final response = await client.post(
      Uri.parse(url),
      body: user,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body);
      return AuthenticationModel.fromJson(data);
    } else {
      throw FetchDataException(
          'Failed to create a new user');
    }
  }
}
