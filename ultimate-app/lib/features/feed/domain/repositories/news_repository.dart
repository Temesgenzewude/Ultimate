import 'package:dartz/dartz.dart';
import 'package:flutter_ultimate/core/error/failure.dart';
import 'package:flutter_ultimate/features/feed/domain/entities/feed_entity.dart';
import 'package:flutter_ultimate/features/feed/domain/entities/notification_entitiy.dart';

abstract class FeedRepository {
  Future<Either<Failure, FeedEntity>> getNews(String id);
  Future<Either<Failure, List<FeedEntity>>> getAllNews();
  Future<Either<Failure, List<NotificationEntity>>> getAdminNotification();
  Future<Either<Failure, List<NotificationEntity>>> getUserNotification();
}
