part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class SignInEvent extends AuthenticationEvent {
  SignInEvent({required this.user});
  final LoginRequestModel user;
}

class SignUpEvent extends AuthenticationEvent {
  SignUpEvent({required this.newUser});
  final AuthenticationModel newUser;
}