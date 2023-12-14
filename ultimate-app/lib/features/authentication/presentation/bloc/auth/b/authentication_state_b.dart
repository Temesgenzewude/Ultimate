part of 'authentication_bloc_b.dart';

abstract class AuthenticationBState {
  const AuthenticationBState();
}

class AuthenticationInitialStateB extends AuthenticationBState {}

class AuthenticationLoadingStateB extends AuthenticationBState {}



class AuthenticationSuccessStateB extends AuthenticationBState {
  const AuthenticationSuccessStateB({required this.user});
  final UserBSingUpResponse user;
}

class LoginSuccessStateB extends AuthenticationBState {
  const LoginSuccessStateB({required this.loginResponse});
  final LoginResponseModel loginResponse;
}

class LoginFailureStateB extends AuthenticationBState {
  const LoginFailureStateB({required this.errorMessage});
  final String errorMessage;
}

class LoginLoadingStateB extends AuthenticationBState {}

class AuthenticationFailureStateB extends AuthenticationBState {
  const AuthenticationFailureStateB({required this.errorMessage});
  final String errorMessage;
}

class UserBLogoutSuccessState extends AuthenticationBState {}

class UserBLogoutFailureState extends AuthenticationBState {
  const UserBLogoutFailureState({required this.errorMessage});
  final String errorMessage;
}

class UserBLogoutLoadingState extends AuthenticationBState {}