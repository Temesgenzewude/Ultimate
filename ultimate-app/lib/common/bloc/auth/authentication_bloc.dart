import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/data/models/authentication_model.dart';
import 'package:flutter_ultimate/data/repositories/auth/auth_repo.dart';

import '../../../data/models/login_request_model.dart';
import '../../../data/models/login_response_model.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required this.authenticationRepository,
  }) : super(AuthenticationInitialState()) {
    on<SignInEvent>(_signIn);
    on<SignUpEvent>(_signUp);
  }
  final AuthenticationRepository authenticationRepository;

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

  void _signIn(SignInEvent event, Emitter<AuthenticationState> emit) async {
    emit(LoginLoadingState());
    try {
      final result = await authenticationRepository.signInUserA(event.user);
      emit(authenticationSuccessOrFailure(result: result, isLogin: true));
    } catch (e) {
      emit(
        authenticationSuccessOrFailure(
            result: e.toString().substring(10), isLogin: true),
      );
    }
  }

  void _signUp(SignUpEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoadingState());
    try {
      final result = await authenticationRepository.signUpUserA(event.newUser);
      emit(authenticationSuccessOrFailure(result: result));
    } catch (e) {
      emit(authenticationSuccessOrFailure(result: e.toString().substring(10)));
    }
  }

  bool isAuthenticated() {
    return state is LoginSuccessState;
  }
}
