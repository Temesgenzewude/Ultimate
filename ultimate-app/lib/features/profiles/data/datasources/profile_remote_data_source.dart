import 'dart:convert';
import 'package:flutter_ultimate/core/error/exception.dart';
import 'package:flutter_ultimate/features/profiles/data/models/user_b_profile_model.dart';
import 'package:http/http.dart' as http;

abstract class ProfileRemoteDataSource {
  Future<UserBProfileModel> getUserBProfile(String id);
  Future<List<UserBProfileModel>> getUserBProfiles();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl({required this.client});
  final http.Client client;
  final uriString =
      'http://13.48.221.106:5001/api/get-user-b/654117b9ca01a37d7f8fe2e8';

  @override
  Future<UserBProfileModel> getUserBProfile(id) async {
    final response = await client.get(Uri.parse(uriString), headers: {
      'Content-Type': 'application/json',
      'Authorization':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTQ0MjI3YTY3NjcxNWE3ZmZlZDk3NTMiLCJpYXQiOjE3MDEyMjE4MDB9.FjFHfuJ96OuCl_V67oICPZqZ1XyGsSEkaYkFtO0H5-Y'
    });
    print("------------Response Body -------------");
    print(response.body);
    print("-------------------");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final userBProfile = UserBProfileModel.fromJson(jsonResponse);
      return userBProfile;
    } else {
      throw const ServerException();
    }
  }

  @override
  Future<List<UserBProfileModel>> getUserBProfiles() async {
    final response = await client.get(Uri.parse(uriString), headers: {
      'Content-Type': 'application/json',
      'Authorization':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTQ0MjI3YTY3NjcxNWE3ZmZlZDk3NTMiLCJpYXQiOjE3MDEyMjE4MDB9.FjFHfuJ96OuCl_V67oICPZqZ1XyGsSEkaYkFtO0H5-Y'
    });
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final profileList = List<Map<String, dynamic>>.from(jsonResponse);
      final userBProfiles = profileList
          .map((json) => UserBProfileModel.fromJson(jsonResponse))
          .toList();
      return userBProfiles;
    } else {
      throw const ServerException();
    }
  }
}
