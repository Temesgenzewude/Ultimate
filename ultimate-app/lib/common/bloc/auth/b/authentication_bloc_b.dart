import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/core/error/exception.dart';
import 'package:flutter_ultimate/data/models/authentication_model.dart';
import 'package:flutter_ultimate/data/models/login_request_model.dart';
import 'package:flutter_ultimate/data/models/login_response_model.dart';
import 'package:flutter_ultimate/data/models/user_sign_up_request_model.dart';
import 'package:flutter_ultimate/data/repositories/auth/auth_repo.dart';

part 'authentication_event_b.dart';
part 'authentication_state_b.dart';

class AuthenticationBlocB
    extends Bloc<AuthenticationEvent, AuthenticationBState> {
  AuthenticationBlocB({
    required this.authenticationRepository,
  }) : super(AuthenticationInitialStateB()) {
    on<UserBSignInEvent>(_signInUserB);
    on<UserBSignUpEvent>(_signUpUserB);
    on<UserBLogoutEvent>(_handleLogoutEvent);
  }
  final AuthenticationRepository authenticationRepository;

  AuthenticationBState authenticationSuccessOrFailureB(
      {dynamic result, bool isLogin = false}) {
    if (result is UserBSingUpResponse) {
      return AuthenticationSuccessStateB(user: result);
    } else if (isLogin && result is LoginResponseModel) {
      return LoginSuccessStateB(loginResponse: result);
    } else if (!isLogin && result is String) {
      return AuthenticationFailureStateB(errorMessage: result);
    } else if (isLogin && result is String) {
      return LoginFailureStateB(errorMessage: result);
    } else {
      return const AuthenticationFailureStateB(
          errorMessage: 'Unexpected error');
    }
  }

  void _signInUserB(
      UserBSignInEvent event, Emitter<AuthenticationBState> emit) async {
    emit(LoginLoadingStateB());
    try {
      final result = await authenticationRepository.signInUserB(event.user);
      emit(authenticationSuccessOrFailureB(result: result, isLogin: true));
    } on NoInternetException catch (e) {
      emit(
        authenticationSuccessOrFailureB(result: e.message, isLogin: true),
      );
    } on ConnectionTimeOutException catch (e) {
      emit(
        authenticationSuccessOrFailureB(result: e.message, isLogin: true),
      );
    } on ServerException catch (e) {
      emit(
        authenticationSuccessOrFailureB(result: e.message, isLogin: true),
      );
    } on UnknownException catch (e) {
      emit(
        authenticationSuccessOrFailureB(result: e.message, isLogin: true),
      );
    }
  }

  void _signUpUserB(
      UserBSignUpEvent event, Emitter<AuthenticationBState> emit) async {
    emit(AuthenticationLoadingStateB());
    try {
      final result = await authenticationRepository.signUpUserB(event.newUser);
      emit(authenticationSuccessOrFailureB(result: result));
    } on NoInternetException catch (e) {
      emit(
        authenticationSuccessOrFailureB(result: e.message, isLogin: false),
      );
    } on ConnectionTimeOutException catch (e) {
      emit(
        authenticationSuccessOrFailureB(result: e.message, isLogin: false),
      );
    } on ServerException catch (e) {
      emit(
        authenticationSuccessOrFailureB(result: e.message, isLogin: false),
      );
    } on UnknownException catch (e) {
      emit(
        authenticationSuccessOrFailureB(result: e.message, isLogin: false),
      );
    }
  }

  FutureOr<void> _handleLogoutEvent(
      UserBLogoutEvent event, Emitter<AuthenticationBState> emit) async {
    emit(UserBLogoutLoadingState());
    try {
      await authenticationRepository.logout();
      emit(UserBLogoutSuccessState());
    } on NoInternetException catch (e) {
      emit(
        UserBLogoutFailureState(errorMessage: e.message),
      );
    } on ConnectionTimeOutException catch (e) {
      emit(
        UserBLogoutFailureState(errorMessage: e.message),
      );
    } on ServerException catch (e) {
      emit(
        UserBLogoutFailureState(errorMessage: e.message),
      );
    } on UnknownException catch (e) {
      emit(
        UserBLogoutFailureState(errorMessage: e.message),
      );
    }
  }

  bool isAuthenticated() {
    return state is LoginSuccessStateB;
  }
}
