part of 'authentication_bloc.dart';


// Define an abstract base class for authentication events
abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

// Define an event for user A sign in
class UserASignInEvent extends AuthenticationEvent {
  UserASignInEvent({required this.user});
  final UserALoginRequestModel user;
}

// Define an event for user A sign up
class UserASignUpEvent extends AuthenticationEvent {
  UserASignUpEvent({required this.newUser});
  final UserAModel newUser;
}

// Define an event for logout
class LogoutEvent extends AuthenticationEvent {}

