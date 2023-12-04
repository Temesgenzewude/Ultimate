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
  final uriString = 'http://api/article/';

  @override
  Future<UserBProfileModel> getUserBProfile(id) async {
    final response = await client.get(Uri.parse(uriString), headers: {
      'Content-Type': 'application/json',
    });
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
