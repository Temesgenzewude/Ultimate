part of 'feed_bloc.dart';

class FeedState extends Equatable {
  const FeedState();
  
  @override
  List<Object> get props => [];
}

class FeedInitialState extends FeedState {}
class FeedLoadingState extends FeedState {}

class FeedSuccessState extends FeedState {}