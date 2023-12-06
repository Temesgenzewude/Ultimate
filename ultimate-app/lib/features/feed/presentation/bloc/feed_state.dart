part of 'feed_bloc.dart';

abstract class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object?> get props => [];
}

class FeedInitialState extends FeedState {}

class FeedLoadingState extends FeedState {}

class FeedSuccessState extends FeedState {
  const FeedSuccessState({required this.feed});
  final FeedEntity feed;

  @override
  List<Object?> get props => [feed];
}

class FeedsSuccessState extends FeedState {
  const FeedsSuccessState({required this.feeds});
  final List<FeedEntity> feeds;

  @override
  List<Object?> get props => [feeds];
}

class FeedFailureState extends FeedState {
  const FeedFailureState({required this.error});
  final Failure error;

  @override
  List<Object?> get props => [error];
}
