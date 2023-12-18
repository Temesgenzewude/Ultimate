part of 'subscription_bloc_bloc.dart';

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
