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
