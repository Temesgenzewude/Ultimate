part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class SignInEvent extends AuthenticationEvent {
  SignInEvent({required this.user});
  final UserALoginRequestModel user;
}

class SignUpEvent extends AuthenticationEvent {
  SignUpEvent({required this.newUser});
  final UserAModel newUser;
}
