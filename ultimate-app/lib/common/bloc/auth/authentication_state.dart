part of 'authentication_bloc.dart';

abstract class AuthenticationState {
  const AuthenticationState();
}

class AuthenticationInitialState extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {}

class AuthSignUPSuccess extends AuthenticationState {}

class AuthenticationSuccessState extends AuthenticationState {
  const AuthenticationSuccessState({required this.user});
  final SingUpResponseModel user;
}

class LoginSuccessState extends AuthenticationState {
  const LoginSuccessState({required this.loginResponse});
  final LoginResponseModel loginResponse;
}

class LoginFailureState extends AuthenticationState {
  const LoginFailureState({required this.errorMessage});
  final String errorMessage;
}

class LoginLoadingState extends AuthenticationState {}

class AuthenticationFailureState extends AuthenticationState {
  const AuthenticationFailureState({required this.errorMessage});
  final String errorMessage;
}
