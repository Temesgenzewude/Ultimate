part of 'account_information_bloc.dart';

abstract class UserBAccInfoState {
  const UserBAccInfoState();
}

class UserBAccInfoInitialState extends UserBAccInfoState {}

class UserBAccInfoLoadingState extends UserBAccInfoState {}

class UserBAccInfoSuccessState extends UserBAccInfoState {
  const UserBAccInfoSuccessState();
  // final SingUpResponseModel user;
}

class UserBAccFailureState extends UserBAccInfoState {
  const UserBAccFailureState({required this.errorMessage});
  final String errorMessage;
}
