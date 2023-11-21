import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/social_login_request_model.dart';
import '../../../data/models/social_login_response_model.dart';
import '../../../data/repositories/auth/auth_repo.dart';

part 'auth_social_event.dart';
part 'auth_social_state.dart';

class AuthSocialBloc extends Bloc<AuthSocialEvent, AuthSocialState> {
  AuthSocialBloc({required this.authenticationRepository})
      : super(AuthSocialInitialState()) {
    on<FaceBookOrTwitterSignInEvent>(_facebookOrTwitterSignIn);
  }

  final AuthenticationRepository authenticationRepository;

  FutureOr<void> _facebookOrTwitterSignIn(
      FaceBookOrTwitterSignInEvent event, Emitter<AuthSocialState> emit) async {
    emit(AuthSocialLoadingState());
    try {
      final result = await authenticationRepository
          .loginSocial(event.socialLoginRequestModel);

      emit(authSocialSuccessOrFailure(result: result));
    } catch (e) {
      emit(authSocialSuccessOrFailure(result: e.toString()));
    }
  }

  AuthSocialState authSocialSuccessOrFailure({dynamic result}) {
    if (result is SocialLoginResponseModel) {
      return AuthSocialSuccessState(socialLoginResponseModel: result);
    } else if (result is String) {
      return AuthSocialFailureState(error: result);
    } else {
      return const AuthSocialFailureState(error: 'Unexpected error');
    }
  }
}
