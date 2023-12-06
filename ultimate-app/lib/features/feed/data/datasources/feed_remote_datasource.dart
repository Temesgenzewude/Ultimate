import 'dart:convert';
import 'package:flutter_ultimate/core/error/exception.dart';
import 'package:flutter_ultimate/features/feed/data/models/feed_model.dart';
import 'package:http/http.dart' as http;

abstract class FeedRemoteDataSource {
  Future<FeedModel> getNews(String id);
  Future<List<FeedModel>> getAllNews();
}

class FeedRemoteDataSourceImpl implements FeedRemoteDataSource {
  FeedRemoteDataSourceImpl({required this.client});

  final http.Client client;
  final uriString = 'http://13.48.221.106:5001/api/get-news/';

  @override
  Future<List<FeedModel>> getAllNews() async {
    final response = await client.get(Uri.parse(uriString), headers: {
      'Content-Type': 'application/json',
      'Authorization':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTQ0MjI3YTY3NjcxNWE3ZmZlZDk3NTMiLCJpYXQiOjE3MDEyMjE4MDB9.FjFHfuJ96OuCl_V67oICPZqZ1XyGsSEkaYkFtO0H5-Y'
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
      'Authorization':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTQ0MjI3YTY3NjcxNWE3ZmZlZDk3NTMiLCJpYXQiOjE3MDEyMjE4MDB9.FjFHfuJ96OuCl_V67oICPZqZ1XyGsSEkaYkFtO0H5-Y'
    });
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final feedNews = FeedModel.fromJson(jsonResponse);
      return feedNews;
    } else {
      throw const ServerException();
    }
  }
}
