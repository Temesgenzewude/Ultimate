import 'package:flutter_ultimate/core/error/exception.dart';
import 'package:http/http.dart' as http;

abstract class SubscriptionRemoteDataSource {
  Future<bool> subscribeToUserBProfile(String id);
}

class SubscriptionRemoteDataSourceImpl implements SubscriptionRemoteDataSource {
  SubscriptionRemoteDataSourceImpl({required this.client});
  final http.Client client;
  final uriString =
      'http://13.48.221.106:5001/api/subscribe/650b1e64137ef2de2ccad3d0';

  @override
  Future<bool> subscribeToUserBProfile(id) async {
    print('id $id');
    final response = await client.get(
      Uri.parse('$uriString/$id'),
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
