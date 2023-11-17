part of 'authentication_bloc.dart';

abstract class AuthenticationState {
  const AuthenticationState();
}

class AuthenticationInitialState extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationSuccessState extends AuthenticationState {
  final AuthenticationModel user;

  const AuthenticationSuccessState({required this.user});
}

class AuthenticationFailureState extends AuthenticationState {
  final String errorMessage;

  const AuthenticationFailureState({required this.errorMessage});
}