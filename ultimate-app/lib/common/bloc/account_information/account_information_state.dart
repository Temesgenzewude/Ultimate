part of 'account_information_bloc.dart';

// Define an abstract class for the account information state
abstract class AccInfoState {
  const AccInfoState();
}

// Define a class for the initial state of the account information
class AccInfoInitialState extends AccInfoState {}

// Define a class for the loading state of the account information
class AccInfoLoadingState extends AccInfoState {}

// Define a class for the success state of the account information
class AccInfoSuccessState extends AccInfoState {
  const AccInfoSuccessState();
  // final SingUpResponseModel user;
}

// Define a class for the failure state of the account information
class AccFailureState extends AccInfoState {
  const AccFailureState({required this.errorMessage});
  final String errorMessage;
}
