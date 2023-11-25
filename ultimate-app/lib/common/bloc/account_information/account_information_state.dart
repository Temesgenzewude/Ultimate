part of 'account_information_bloc.dart';

abstract class AccInfoState {
  const AccInfoState();
}

class AccInfoInitialState extends AccInfoState {}

class AccInfoLoadingState extends AccInfoState {}

class AccInfoSuccessState extends AccInfoState {
  const AccInfoSuccessState();
  // final SingUpResponseModel user;
}

class AccFailureState extends AccInfoState {
  const AccFailureState({required this.errorMessage});
  final String errorMessage;
}
