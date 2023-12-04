import 'package:dartz/dartz.dart';
import 'package:flutter_ultimate/core/error/failure.dart';
import 'package:flutter_ultimate/features/profiles/domain/entities/user_b_profile_entity.dart';
import 'package:flutter_ultimate/features/profiles/domain/repositories/profile_repository.dart';

class GetUserBProfile {
  GetUserBProfile({required this.repository});
  final ProfileRepository repository;

  Future<Either<Failure, UserBProfile>> call(String id) async {
    return await repository.getUserBProfile(id);
  }
}
