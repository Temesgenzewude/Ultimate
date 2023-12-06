// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/core/error/failure.dart';
import 'package:flutter_ultimate/features/feed/domain/entities/feed_entity.dart';
import 'package:flutter_ultimate/features/feed/domain/usecases/get_all_news.dart';
import 'package:flutter_ultimate/features/feed/domain/usecases/get_news.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc({
    required this.getAllNews,
    required this.getNews,
  }) : super(FeedInitialState()) {
    on<GetFeedsEvent>(_getAllFeed);
    on<GetFeedByIdEvent>(_getFeed);
  }

  final GetNews getNews;
  final GetAllNews getAllNews;

  // success or failure converter for getNews usecase
  FeedState FeedSuccessOrFailure(Either<Failure, FeedEntity> data) {
    return data.fold(
      (failure) => FeedFailureState(error: failure),
      (success) => FeedSuccessState(feed: success),
    );
  }

  // success or failure converter for getAllNews usecase
  FeedState FeedsSuccessOrFailure(Either<Failure, List<FeedEntity>> data) {
    return data.fold(
      (failure) => FeedFailureState(error: failure),
      (success) => FeedsSuccessState(feeds: success),
    );
  }

  Future<void> _getFeed(GetFeedByIdEvent event, Emitter<FeedState> emit) async {
    emit(FeedLoadingState());

    final result = await getNews(event.feedId);
    print('-------------- result ---------------');
    print(result);
    print('--------------- result');
    emit(FeedSuccessOrFailure(result));
  }

  Future<void> _getAllFeed(GetFeedsEvent event, Emitter<FeedState> emit) async {
    emit(FeedLoadingState());

    final result = await getAllNews();
    print('-------------- result ---------------');
    print(result);
    print('--------------- result');
    emit(FeedsSuccessOrFailure(result));
  }
}
