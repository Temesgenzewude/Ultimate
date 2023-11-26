part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class UserASignInEvent extends AuthenticationEvent {
  UserASignInEvent({required this.user});
  final UserALoginRequestModel user;
}

class UserASignUpEvent extends AuthenticationEvent {
  UserASignUpEvent({required this.newUser});
  final UserAModel newUser;
}

class LogoutEvent extends AuthenticationEvent {}
