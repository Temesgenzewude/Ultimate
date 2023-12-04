import 'package:dartz/dartz.dart';
import 'package:flutter_ultimate/core/error/failure.dart';
import 'package:flutter_ultimate/features/profiles/domain/entities/user_b_profile_entity.dart';
import 'package:flutter_ultimate/features/profiles/domain/repositories/profile_repository.dart';

class GetUserBProfiles {
  const GetUserBProfiles({required this.repository});
  final ProfileRepository repository;

  Future<Either<Failure, List<UserBProfile>>> call() async {
    return await repository.getUserBProfiles();
  }
}
