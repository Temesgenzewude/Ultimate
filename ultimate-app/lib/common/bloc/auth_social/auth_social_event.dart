part of 'auth_social_bloc.dart';

class AuthSocialEvent extends Equatable {
  const AuthSocialEvent();

  @override
  List<Object> get props => [];
}


class FaceBookOrTwitterSignInEvent extends AuthSocialEvent {
  const FaceBookOrTwitterSignInEvent({required this.socialLoginRequestModel});
  final SocialLoginRequestModel socialLoginRequestModel;
}


