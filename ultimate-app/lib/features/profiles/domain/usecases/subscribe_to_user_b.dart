import 'package:dartz/dartz.dart';
import 'package:flutter_ultimate/core/error/failure.dart';
import 'package:flutter_ultimate/features/profiles/domain/repositories/subscription_repository.dart';

class SubscribeToUserB {
  const SubscribeToUserB({required this.repository});
  final SubscriptionRepository repository;

  Future<Either<Failure, bool>> call(String id) async {
    print('id in usecase $id');
    return await repository.subscribeToUserB(id);
  }
}
