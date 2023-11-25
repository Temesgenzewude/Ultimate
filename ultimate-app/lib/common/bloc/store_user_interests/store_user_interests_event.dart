part of 'store_user_interests_bloc.dart';

abstract class StoreUserInterestsEvent extends Equatable {
  const StoreUserInterestsEvent();

  @override
  List<Object> get props => [];
}

class StoreUserInterestsEventCall extends StoreUserInterestsEvent {
  const StoreUserInterestsEventCall({required this.saveUserInterestRequest});

  final SaveUserInterestRequest saveUserInterestRequest;

  @override
  List<Object> get props => [saveUserInterestRequest];
}
