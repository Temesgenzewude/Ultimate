import 'package:dartz/dartz.dart';
import 'package:flutter_ultimate/core/error/failure.dart';
import 'package:flutter_ultimate/features/feed/domain/entities/feed_entity.dart';

abstract class FeedRepository {
  Future<Either<Failure, FeedEntity>> getNews(String id);
  Future<Either<Failure, List<FeedEntity>>> getAllNews();
}
