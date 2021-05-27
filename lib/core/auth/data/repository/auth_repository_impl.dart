import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:storayge/core/auth/data/models/storayge_user_model.dart';
import 'package:storayge/core/constants/app_const.dart';

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
        final StoraygeUserModel remoteStoraygeUser =
            await remoteDataSource.getStoraygeUserDataFromRemote(uid: uid);
        localDataSource.cacheStoraygeUser(remoteStoraygeUser);
        final storaygeUser = StoraygeUser(
          username: remoteStoraygeUser.username,
          email: remoteStoraygeUser.email,
          uid: remoteStoraygeUser.uid,
        );
        return Right(storaygeUser);
      } on FirebaseException catch (e) {
        return Left(FirestoreFailure(
          code: e.code,
          message: e.message,
        ));
      }
    } else {
      try {
        final StoraygeUserModel localStoraygeUser =
            await localDataSource.getCachedStoraygeUser();
        final storaygeUser = StoraygeUser(
          username: localStoraygeUser.username,
          email: localStoraygeUser.email,
          uid: localStoraygeUser.uid,
        );
        return Right(storaygeUser);
      } on CacheException {
        return const Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, StoraygeUser>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final storaygeUserModelAfterLogin = await remoteDataSource
            .loginWithEmailAndPassword(email: email, password: password);
        localDataSource.cacheStoraygeUser(storaygeUserModelAfterLogin);
        final storaygeUser = StoraygeUser(
          username: storaygeUserModelAfterLogin.username,
          email: storaygeUserModelAfterLogin.email,
          uid: storaygeUserModelAfterLogin.uid,
        );
        return Right(storaygeUser);
      } on FirebaseAuthException catch (e) {
        return Left(FirebaseAuthFailure(
          code: e.code,
          message: e.message,
        ));
      }
    } else {
      return const Left(ServerFailure(
        code: ERROR_NO_INTERNET_CONNECTION,
        message: MESSAGE_NO_INTERNET_CONNECTION,
      ));
    }
  }
}
