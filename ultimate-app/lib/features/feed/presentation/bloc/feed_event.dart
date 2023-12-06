part of 'feed_bloc.dart';

class FeedEvent extends Equatable {
  const FeedEvent();

  @override
  List<Object> get props => [];
}

class GetFeedEvent extends FeedEvent {}
class GetFeedsEvent extends FeedEvent {}
class CreateFeedsEvent extends FeedEvent {}