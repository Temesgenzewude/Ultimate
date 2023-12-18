import 'package:dartz/dartz.dart';
import 'package:flutter_ultimate/core/error/failure.dart';

abstract class SubscriptionRepository {
  Future<Either<Failure, bool>> subscribeToUserB(String id);
}
