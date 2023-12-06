import 'package:dartz/dartz.dart';
import 'package:flutter_ultimate/core/error/exception.dart';
import 'package:flutter_ultimate/core/error/failure.dart';
import 'package:flutter_ultimate/core/network/network_info.dart';
import 'package:flutter_ultimate/features/feed/data/datasources/feed_remote_datasource.dart';
import 'package:flutter_ultimate/features/feed/domain/entities/feed_entity.dart';
import 'package:flutter_ultimate/features/feed/domain/repositories/news_repository.dart';

class FeedRepositoryImpl extends FeedRepository {
  final FeedRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  FeedRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  Future<Either<Failure, FeedEntity>> getNews(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final feedNews = await remoteDataSource.getNews(id);
        return Right(feedNews);
      } on ServerException {
        return const Left(ServerFailure('Internal Server'));
      }
    } else {
      return const Left(NetworkFailure('No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, List<FeedEntity>>> getAllNews() async {
    if (await networkInfo.isConnected) {
      try {
        final feedNews = await remoteDataSource.getAllNews();
        return Right(feedNews);
      } on ServerException {
        return const Left(ServerFailure('Internal Server'));
      }
    } else {
      return const Left(NetworkFailure('No Internet Connection'));
    }
  }
}
