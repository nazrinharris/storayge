import 'package:dartz/dartz.dart';

import '../../../errors/failures.dart';
import '../entities/storayge_user.dart';

abstract class AuthRepository {
  Future<Either<Failure, StoraygeUser>> getStoraygeUserDataFromRemote({
    required String uid,
  });

  Future<Either<Failure, StoraygeUser>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, StoraygeUser>> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  });

  Future<Either<Failure, String>> getUid();

  Future<Either<Failure, Unit>> signOut();

  Future<Either<Failure, bool>> isFirstTimeOpeningApp();

  Future<Either<Failure, StoraygeUser>> isLoggedIn();
}
