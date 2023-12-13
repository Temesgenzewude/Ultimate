import 'package:dartz/dartz.dart';
import 'package:flutter_ultimate/core/error/failure.dart';
import 'package:flutter_ultimate/features/feed/domain/entities/notification_entitiy.dart';
import 'package:flutter_ultimate/features/feed/domain/repositories/news_repository.dart';

class GetUserNotification {
  GetUserNotification({required this.repository});
  final FeedRepository repository;

  Future<Either<Failure, List<NotificationEntity>>> call() async {
    return repository.getAdminNotification();
  }
}
