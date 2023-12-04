import 'package:dartz/dartz.dart';
import 'package:flutter_ultimate/core/error/failure.dart';
import '../entities/user_b_profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, List<UserBProfile>>> getUserBProfiles();
  Future<Either<Failure, UserBProfile>> getUserBProfile(String id);
}
