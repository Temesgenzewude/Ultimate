part of 'authentication_bloc_b.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class UserBSignInEvent extends AuthenticationEvent {
  UserBSignInEvent({required this.user});
  final UserBLoginRequestModel user;
}

class UserBSignUpEvent extends AuthenticationEvent {
  UserBSignUpEvent({required this.newUser});
  final UserBModel newUser;
}
