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
}
