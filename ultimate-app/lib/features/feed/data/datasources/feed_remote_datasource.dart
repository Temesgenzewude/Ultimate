import 'dart:convert';
import 'package:flutter_ultimate/core/error/exception.dart';
import 'package:flutter_ultimate/dependency_indjection.dart';
import 'package:flutter_ultimate/features/feed/data/models/feed_model.dart';
import 'package:flutter_ultimate/features/feed/data/models/notification_model.dart';
import 'package:flutter_ultimate/sharedPreferences.dart';
import 'package:http/http.dart' as http;

final prefManager = sl<PrefManager>();

abstract class FeedRemoteDataSource {
  Future<FeedModel> getNews(String id);
  Future<List<FeedModel>> getAllNews();
  Future<List<NotificationModel>> getAdminNotifications();
  Future<List<NotificationModel>> getUserNotifications();
}

class FeedRemoteDataSourceImpl implements FeedRemoteDataSource {
  FeedRemoteDataSourceImpl({required this.client});

  final String token = prefManager.token != null
      ? prefManager.token!
      : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTQ0MjI3YTY3NjcxNWE3ZmZlZDk3NTMiLCJpYXQiOjE3MDEyMTc5ODJ9.-PQ-asf1kutm-aROOOJU1ldheEogRK6ekMuzBF1GevA';

  final http.Client client;
  final uriString = 'http://13.48.221.106:5001/api/get-all-news';

  @override
  Future<List<FeedModel>> getAllNews() async {
    final response = await client.get(Uri.parse(uriString), headers: {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    });
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final feedNewsJsonList = List<Map<String, dynamic>>.from(jsonResponse);
      final feedNewsList =
          feedNewsJsonList.map((json) => FeedModel.fromJson(json)).toList();
      return feedNewsList;
    } else {
      throw const ServerException();
    }
  }

  @override
  Future<FeedModel> getNews(String id) async {
    final response = await client.get(Uri.parse(uriString), headers: {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    });
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final feedNews = FeedModel.fromJson(jsonResponse);
      return feedNews;
    } else {
      throw const ServerException();
    }
  }

  @override
  Future<List<NotificationModel>> getAdminNotifications() async {
    const String uriString =
        'http://13.48.221.106:5001/api/get-admin-notification/64c4f6f91023faf0c2eea068/64c4ec3a56ae9671a80794d7';
    final response = await client.get(Uri.parse(uriString), headers: {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> jsonResponse = data['data'];
      final adminNotifications =
          jsonResponse.map((json) => NotificationModel.fromJson(json)).toList();

      return adminNotifications;
    } else {
      throw const ServerException();
    }
  }

  @override
  Future<List<NotificationModel>> getUserNotifications() async {
    const String uriString =
        'http://13.48.221.106:5001/api/get-user-notification/65667b59387a98014c307455/654117b9ca01a37d7f8fe2e8';
    final response = await client.get(Uri.parse(uriString), headers: {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    });
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      final userNotifications =
          jsonResponse.map((json) => NotificationModel.fromJson(json)).toList();

      return userNotifications;
    } else {
      throw const ServerException();
    }
  }
}
