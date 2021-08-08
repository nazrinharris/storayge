import 'package:fpdart/fpdart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:supercharged/supercharged.dart';

import '../../../constants/app_const.dart';
import '../../../errors/exceptions.dart';
import '../../../errors/failures.dart';
import '../../../network/network_info.dart';
import '../../domain/entities/storayge_user.dart';
import '../../domain/i_repository/i_auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/storayge_user_model.dart';

class AuthRepository implements IAuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepository({
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

  @override
  Future<Either<Failure, StoraygeUser>> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.registerWithEmailAndPassword(
          email: email,
          password: password,
          username: username,
        );
        await localDataSource.cacheStoraygeUser(result);
        final storaygeUser = StoraygeUser(
          username: result.username,
          email: result.email,
          uid: result.uid,
        );
        return Right(storaygeUser);
      } on FirebaseAuthException catch (e) {
        return Left(FirebaseAuthFailure(
          code: e.code,
          message: e.message,
        ));
      }
    } else {
      return const Left(NoConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getUid() async {
    try {
      final uid = await remoteDataSource.getUid();
      return Right(uid);
    } on UserNotFoundException {
      return const Left(UserFailure(
        code: ERROR_USER_NOT_FOUND,
        message: MESSAGE_USER_NOT_FOUND,
      ));
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await remoteDataSource.signOut();
      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthFailure(
        code: e.code,
        message: e.message,
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> isFirstTimeOpeningApp() async {
    // TODO: create tests
    try {
      final bool isNewUser = await localDataSource.isFirstTimeOpeningApp();
      return Right(isNewUser);
    } catch (e) {
      return const Left(StorageFailure(
        message: 'Unknown Storage Failure',
        code: ERROR_UNKNOWN_OCCURED,
      ));
    }
  }

  @override
  Future<Either<Failure, StoraygeUser>> isLoggedIn() async {
    // TODO: create tests
    try {
      final userFromRemote = await remoteDataSource.isLoggedIn();
      return Right(userFromRemote);
    } on UserNotFoundException {
      return Left(UserNotFoundFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> isEmailNotRegistered(String email) async {
    // TODO: implement isEmailNotRegistered
    // TODO: create tests
    if (await networkInfo.isConnected) {
      bool isEmailNotRegistered =
          await remoteDataSource.isEmailNotRegistered(email);
      if (isEmailNotRegistered) {
        return const Right(true);
      } else {
        return const Left(
          BoolFailure(
            code: ERROR_EMAIL_ALREADY_USED,
            message: MESSAGE_EMAIL_ALREADY_IN_USE,
          ),
        );
      }
    } else {
      return const Left(NoConnectionFailure());
    }
  }
}
