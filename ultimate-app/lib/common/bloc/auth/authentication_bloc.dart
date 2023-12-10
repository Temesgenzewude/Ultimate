import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/core/error/exception.dart';
import 'package:flutter_ultimate/data/models/authentication_model.dart';
import 'package:flutter_ultimate/data/repositories/auth/auth_repo.dart';

import '../../../data/models/login_request_model.dart';
import '../../../data/models/login_response_model.dart';
import '../../../data/models/user_sign_up_request_model.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required this.authenticationRepository,
  }) : super(AuthenticationInitialState()) {
    on<UserASignInEvent>(_signInUserA);
    on<UserASignUpEvent>(_signUpUserA);

    on<LogoutEvent>(_handleLogoutEvent);
  }

  final AuthenticationRepository authenticationRepository;

  // Maps the result of authentication to the corresponding state
  AuthenticationState authenticationSuccessOrFailure(
      {dynamic result, bool isLogin = false}) {
    if (result is SingUpResponseModel) {
      return AuthenticationSuccessState(user: result);
    } else if (result is LoginResponseModel) {
      return LoginSuccessState(loginResponse: result);
    } else if (!isLogin && result is String) {
      return AuthenticationFailureState(errorMessage: result);
    } else if (isLogin && result is String) {
      return LoginFailureState(errorMessage: result);
    } else {
      return const AuthenticationFailureState(errorMessage: 'Unexpected error');
    }
  }

  // Handles the UserASignInEvent
  void _signInUserA(UserASignInEvent event, Emitter<AuthenticationState> emit) async {
    emit(LoginLoadingState());
    try {
      final result = await authenticationRepository.signInUserA(event.user);
      emit(authenticationSuccessOrFailure(result: result, isLogin: true));
    } on NoInternetException catch (e) {
      emit(authenticationSuccessOrFailure(result: e.message, isLogin: true));
    } on ConnectionTimeOutException catch (e) {
      emit(authenticationSuccessOrFailure(result: e.message, isLogin: true));
    } on ServerException catch (e) {
      emit(authenticationSuccessOrFailure(result: e.message, isLogin: true));
    } on UnknownException catch (e) {
      emit(authenticationSuccessOrFailure(result: e.message, isLogin: true));
    }
  }

  // Handles the UserASignUpEvent
  void _signUpUserA(UserASignUpEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoadingState());
    try {
      final result = await authenticationRepository.signUpUserA(event.newUser);
      emit(authenticationSuccessOrFailure(result: result));
    } on NoInternetException catch (e) {
      emit(authenticationSuccessOrFailure(result: e.message, isLogin: false));
    } on ConnectionTimeOutException catch (e) {
      emit(authenticationSuccessOrFailure(result: e.message, isLogin: false));
    } on ServerException catch (e) {
      emit(authenticationSuccessOrFailure(result: e.message, isLogin: false));
    } on UnknownException catch (e) {
      emit(authenticationSuccessOrFailure(result: e.message, isLogin: false));
    }
  }

  // Checks if the user is authenticated
  bool isAuthenticated() {
    return state is LoginSuccessState;
  }

  // Handles the LogoutEvent
  FutureOr<void> _handleLogoutEvent(LogoutEvent event, Emitter<AuthenticationState> emit) async {
    emit(LogoutLoadingState());
    try {
      await authenticationRepository.logout();
      emit(LogoutSuccessState());
    } on NoInternetException catch (e) {
      emit(LogoutFailureState(errorMessage: e.message));
    } on ConnectionTimeOutException catch (e) {
      emit(LogoutFailureState(errorMessage: e.message));
    } on ServerException catch (e) {
      emit(LogoutFailureState(errorMessage: e.message));
    } on UnknownException catch (e) {
      emit(LogoutFailureState(errorMessage: e.message));
    }
  }
}
