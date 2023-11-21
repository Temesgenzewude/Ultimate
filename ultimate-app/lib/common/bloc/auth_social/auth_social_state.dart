part of 'auth_social_bloc.dart';

class AuthSocialState extends Equatable {
  const AuthSocialState();

  @override
  List<Object> get props => [];
}

class AuthSocialInitialState extends AuthSocialState {}

class AuthSocialLoadingState extends AuthSocialState {}

class AuthSocialSuccessState extends AuthSocialState {
  const AuthSocialSuccessState({required this.socialLoginResponseModel});
  final SocialLoginResponseModel socialLoginResponseModel;

  @override
  List<Object> get props => [socialLoginResponseModel];
}

class AuthSocialFailureState extends AuthSocialState {
  const AuthSocialFailureState({required this.error});
  final String error;

  @override
  List<Object> get props => [error];
}
