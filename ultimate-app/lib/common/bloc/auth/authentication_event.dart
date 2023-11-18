part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class SignInEvent extends AuthenticationEvent {
  final AuthenticationModel user;

  SignInEvent({required this.user});
}

class SignUpEvent extends AuthenticationEvent {
  final AuthenticationModel newUser;

  SignUpEvent({required this.newUser});
}
