import 'package:dartz/dartz.dart';
import 'package:flutter_ultimate/core/error/exception.dart';
import 'package:flutter_ultimate/core/error/failure.dart';
import 'package:flutter_ultimate/core/network/network_info.dart';
import 'package:flutter_ultimate/features/profiles/data/datasources/profile_remote_data_source.dart';
import 'package:flutter_ultimate/features/profiles/domain/entities/user_b_profile_entity.dart';
import 'package:flutter_ultimate/features/profiles/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  final ProfileRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, UserBProfile>> getUserBProfile(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final userBProfile = await remoteDataSource.getUserBProfile(id);
        return Right(userBProfile);
      } on ServerException {
        return const Left(ServerFailure('Internal Server'));
      }
    } else {
      return const Left(NetworkFailure('No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, List<UserBProfile>>> getUserBProfiles() async {
    if (await networkInfo.isConnected) {
      try {
        final userBProfiles = await remoteDataSource.getUserBProfiles();
        print('--------------------');
        print(userBProfiles);
        print('-----------------');
        return Right(userBProfiles);
      } on ServerException {
        return const Left(ServerFailure('Internal Server Error'));
      }
    } else {
      return const Left(NetworkFailure('No Internet Connection'));
    }
  }
}
