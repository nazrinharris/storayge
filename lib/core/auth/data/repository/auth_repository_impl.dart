import 'package:dartz/dartz.dart';

import '../../../errors/exceptions.dart';
import '../../../errors/failures.dart';
import '../../../network/network_info.dart';
import '../../domain/entities/storayge_user.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, StoraygeUser>> getStoraygeUserDataFromRemote({
    required String uid,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteStoraygeUser =
            await remoteDataSource.getStoraygeUserDataFromRemote(uid: uid);
        localDataSource.cacheStoraygeUser(remoteStoraygeUser);
        return Right(remoteStoraygeUser);
      } on FirestoreException {
        return Left(FirestoreFailure('error'));
      }
    } else {
      try {
        final localStoraygeUser = await localDataSource.getCachedStoraygeUser();
        return Right(localStoraygeUser);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, StoraygeUser>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }
}
