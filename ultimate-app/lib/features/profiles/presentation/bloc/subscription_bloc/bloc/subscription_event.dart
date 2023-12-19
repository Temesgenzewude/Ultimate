part of 'subscription_bloc.dart';

abstract class SubscriptionEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubscribeToUserBEvent extends SubscriptionEvent {
  SubscribeToUserBEvent({required this.userBId});
  final String userBId;

  @override
  List<Object?> get props => [userBId];
}

class UnSubscribeToUserBEvent extends SubscriptionEvent {
  UnSubscribeToUserBEvent({required this.userBId});
  final String userBId;

  @override
  List<Object?> get props => [userBId];
}
