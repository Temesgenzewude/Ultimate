import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ignore: avoid_classes_with_only_static_members
class SocialLoginApi {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> googleSignIn() => _googleSignIn.signIn();

  static Future signOut() => _googleSignIn.signOut();

  static Future<Map<String, dynamic>> facebookSignIn() async {
    final Map<String, dynamic> _userData = <String, dynamic>{};
    try {
      final LoginResult result = await FacebookAuth.instance
          .login(permissions: ["public_profile", "email"]);
      final userData = await FacebookAuth.instance.getUserData();
      print('name: ${userData['name']}');
      print('email: ${userData['email']}');
      print('photo: ${userData['picture']['data']['url']}');
      print('id: ${userData['id']}');
      print('token: ${result.accessToken?.token}');

      _userData['name'] = userData['name'];
      _userData['email'] = userData['email'];
      _userData['photo'] = userData['picture']['data']['url'];
      _userData['id'] = userData['id'];
      _userData['token'] = result.accessToken?.token;
      _userData['success'] = true;

      print('user $_userData');
    } catch (e) {
      print('error $e');

      _userData['success'] = false;

      return _userData;
    }

    return _userData;
  }
}
