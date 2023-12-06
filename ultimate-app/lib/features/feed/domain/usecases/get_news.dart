import 'package:dartz/dartz.dart';
import 'package:flutter_ultimate/core/error/failure.dart';
import 'package:flutter_ultimate/features/feed/domain/entities/feed_entity.dart';
import 'package:flutter_ultimate/features/feed/domain/repositories/news_repository.dart';

class GetNews {
  GetNews({required this.repository});
  final FeedRepository repository;

  Future<Either<Failure, FeedEntity>> call(String id) async {
    return await repository.getNews(id);
  }
}
