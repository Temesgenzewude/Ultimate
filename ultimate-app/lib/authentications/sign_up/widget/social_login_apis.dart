import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ignore: avoid_classes_with_only_static_members
class SocialLoginApi {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> googleSignIn() => _googleSignIn.signIn();

  static Future signOut() => _googleSignIn.signOut();

  static dynamic  facebookSignIn() {
    Map<String, dynamic> _userData = <String, dynamic>{};
    FacebookAuth.instance
        .login(permissions: ["public_profile", "email"]).then((value) {
      FacebookAuth.instance.getUserData().then((userData) async {
        print('name: ${userData['name']}');
        print('email: ${userData['email']}');
        print('photo: ${userData['picture']['data']['url']}');
        print('id: ${userData['id']}');
        print('token: ${value.accessToken?.token}');
        _userData = userData;

        print('user $userData');
      });
    }).onError((error, stackTrace) {
      print('error $error');

      return null;


    });

    return _userData;
  }
}
