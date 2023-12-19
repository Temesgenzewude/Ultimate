import 'package:dartz/dartz.dart';
import 'package:flutter_ultimate/core/error/exception.dart';
import 'package:flutter_ultimate/core/error/failure.dart';
import 'package:flutter_ultimate/core/network/network_info.dart';
import 'package:flutter_ultimate/features/profiles/data/datasources/subscription_remote_datasource.dart';
import 'package:flutter_ultimate/features/profiles/domain/repositories/subscription_repository.dart';

class SubscriptionRepositoryImpl implements SubscriptionRepository {
  SubscriptionRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  final SubscriptionRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, bool>> subscribeToUserB(String id) async {
    if (await networkInfo.isConnected) {
      try {
        print('id in repository $id');
        final state = await remoteDataSource.subscribeToUserBProfile(id);
        return Right(state);
      } on ServerException {
        return const Left(ServerFailure('Internal Server'));
      }
    } else {
      return const Left(NetworkFailure('No Internet Connection'));
    }
  }

  Future<Either<Failure, bool>> unSubscribeToUserB(String id) async {
    if (await networkInfo.isConnected) {
      try {
        print('id in repository $id');
        final state = await remoteDataSource.unSubscribeToUserBProfile(id);
        return Right(state);
      } on ServerException {
        return const Left(ServerFailure('Internal Server Error'));
      }
    } else {
      return const Left(NetworkFailure('No Internet Connection'));
    }
  }
}
