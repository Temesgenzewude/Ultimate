part of 'store_user_interests_bloc.dart';

abstract class StoreUserInterestsState extends Equatable {
  const StoreUserInterestsState();

  @override
  List<Object> get props => [];
}

class StoreUserInterestsInitial extends StoreUserInterestsState {}

class StoreUserInterestsLoadingState extends StoreUserInterestsState {}

class StoreUserInterestsSuccessState extends StoreUserInterestsState {
  const StoreUserInterestsSuccessState({required this.result});

  final SaveUserInterestsResponseModel result;

  @override
  List<Object> get props => [result];
}

class StoreUserInterestsFailureState extends StoreUserInterestsState {
  const StoreUserInterestsFailureState({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
