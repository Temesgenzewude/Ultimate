part of 'authentication_bloc.dart';

abstract class AuthenticationState {
  const AuthenticationState();
}

class AuthenticationInitialState extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationSuccessState extends AuthenticationState {
  const AuthenticationSuccessState({required this.user});
  final AuthenticationModel user;
}

class AuthenticationFailureState extends AuthenticationState {
  const AuthenticationFailureState({required this.errorMessage});
  final String errorMessage;
}
