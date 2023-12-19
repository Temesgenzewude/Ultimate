// ignore_for_file: annotate_overrides

import 'package:flutter_ultimate/core/error/exception.dart';
import 'package:flutter_ultimate/dependency_indjection.dart';
import 'package:flutter_ultimate/sharedPreferences.dart';
import 'package:http/http.dart' as http;

final prefManager = sl<PrefManager>();

abstract class SubscriptionRemoteDataSource {
  Future<bool> subscribeToUserBProfile(String id);
  Future<bool> unSubscribeToUserBProfile(String id);
  Future<bool> getAllSubscribers(String id);
}

class SubscriptionRemoteDataSourceImpl implements SubscriptionRemoteDataSource {
  SubscriptionRemoteDataSourceImpl({required this.client});
  final http.Client client;
  final String token = prefManager.token != null
      ? prefManager.token!
      : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTQ0MjI3YTY3NjcxNWE3ZmZlZDk3NTMiLCJpYXQiOjE3MDEyMTc5ODJ9.-PQ-asf1kutm-aROOOJU1ldheEogRK6ekMuzBF1GevA';
  final userId = prefManager.userID != null ? prefManager.userID : '650715c50bb99669bcab3816';

  @override
  Future<bool> subscribeToUserBProfile(id) async {
    final uriString =
        'http://13.48.221.106:5001/api/subscribe/$userId';
    print('id $id');
    final response = await client.get(
      Uri.parse('$uriString/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token'
      },
    );

    print('---------------------');
    print(response.body);
    print('---------------------');

    if (response.statusCode == 200) {
      return true;
    } else {
      throw const ServerException();
    }
  }

  // unsubscribe a user
  Future<bool> unSubscribeToUserBProfile(id) async {
    const uriString = 'https://teessidetech.live/api/unsubscribe';
    print('id $id');
    final response = await client.get(
      Uri.parse('$uriString/$id/$userId'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            '$token'
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw const ServerException();
    }
  }

  @override
  Future<bool> getAllSubscribers(id) async {
    const String defaultid = '650715c50bb99669bcab3816';
    const uriString =
        'https://teessidetech.live/api/get-user-b-all-subscribers/';
    print('id $id');
    final response = await client.get(
      Uri.parse('$uriString/$defaultid/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTQ0MjI3YTY3NjcxNWE3ZmZlZDk3NTMiLCJpYXQiOjE3MDEyMTc5ODJ9.-PQ-asf1kutm-aROOOJU1ldheEogRK6ekMuzBF1GevA'
      },
    );

    print('---------------------');
    print(response.body);
    print('---------------------');

    if (response.statusCode == 200) {
      return true;
    } else {
      throw const ServerException();
    }
  }
}
