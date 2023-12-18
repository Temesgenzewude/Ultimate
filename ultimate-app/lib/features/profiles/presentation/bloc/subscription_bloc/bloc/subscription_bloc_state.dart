part of 'subscription_bloc_bloc.dart';

abstract class SubscriptionState extends Equatable {
  const SubscriptionState();

  @override
  List<Object?> get props => [];
}

class SubscriptionInitialState extends SubscriptionState {}

class SubscriptionLoadingState extends SubscriptionState {}

class SubscriptionSuccessState extends SubscriptionState {}

class SubscriptionFailureState extends SubscriptionState {
  const SubscriptionFailureState({required this.error});

  final Failure error;
}
