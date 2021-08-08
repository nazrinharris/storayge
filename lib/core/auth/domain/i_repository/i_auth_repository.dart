import 'package:fpdart/fpdart.dart';

import '../../../errors/failures.dart';
import '../entities/storayge_user.dart';

abstract class IAuthRepository {
  // User Management
  Future<Either<Failure, StoraygeUser>> getStoraygeUserDataFromRemote({
    required String uid,
  });
  Future<Either<Failure, String>> getUid();
  Future<Either<Failure, bool>> isFirstTimeOpeningApp();
  Future<Either<Failure, StoraygeUser>> isLoggedIn();

  // Login and Sign Out
  Future<Either<Failure, StoraygeUser>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<Failure, Unit>> signOut();

  // Registration
  Future<Either<Failure, StoraygeUser>> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  });
  Future<Either<Failure, bool>> isEmailNotRegistered(String email);
}
