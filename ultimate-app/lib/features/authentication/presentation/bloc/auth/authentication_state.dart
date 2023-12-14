part of 'authentication_bloc.dart';


// Define an abstract class for the AuthenticationState
abstract class AuthenticationState {
  const AuthenticationState();
}

// Define a class for the initial authentication state
class AuthenticationInitialState extends AuthenticationState {}

// Define a class for the authentication loading state
class AuthenticationLoadingState extends AuthenticationState {}

// Define a class for the authentication success state
class AuthenticationSuccessState extends AuthenticationState {
  const AuthenticationSuccessState({required this.user});
  final SingUpResponseModel user;
}

// Define a class for the login success state
class LoginSuccessState extends AuthenticationState {
  const LoginSuccessState({required this.loginResponse});
  final LoginResponseModel loginResponse;
}

// Define a class for the login failure state
class LoginFailureState extends AuthenticationState {
  const LoginFailureState({required this.errorMessage});
  final String errorMessage;
}

// Define a class for the login loading state
class LoginLoadingState extends AuthenticationState {}

// Define a class for the authentication failure state
class AuthenticationFailureState extends AuthenticationState {
  const AuthenticationFailureState({required this.errorMessage});
  final String errorMessage;
}

// Define a class for the logout success state
class LogoutSuccessState extends AuthenticationState {}

// Define a class for the logout failure state
class LogoutFailureState extends AuthenticationState {
  const LogoutFailureState({required this.errorMessage});
  final String errorMessage;
}

// Define a class for the logout loading state
class LogoutLoadingState extends AuthenticationState {}

