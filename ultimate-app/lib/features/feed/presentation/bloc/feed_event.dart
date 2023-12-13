part of 'feed_bloc.dart';

abstract class FeedEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetFeedsEvent extends FeedEvent {}

class GetFeedByIdEvent extends FeedEvent {
  GetFeedByIdEvent({required this.feedId});
  final String feedId;

  List<Object?> get props => [feedId];
}

class GetAdminNotificationsEvent extends FeedEvent {
  GetAdminNotificationsEvent({
    required this.chatId,
    required this.senderId,
  });

  final String chatId;
  final String senderId;
}

class GetUserNotificationsEvent extends FeedEvent {
  GetUserNotificationsEvent({
    required this.chatId,
    required this.senderId,
  });

  final String chatId;
  final String senderId;
}
