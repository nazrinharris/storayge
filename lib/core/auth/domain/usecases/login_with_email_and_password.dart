import 'package:dartz/dartz.dart';

import '../../../errors/failures.dart';
import '../../../usecases/params.dart';
import '../../../usecases/usecase.dart';
import '../entities/storayge_user.dart';
import '../repository/auth_repository.dart';

class LoginWithEmailAndPassword implements Usecase<StoraygeUser, LoginParams> {
  final AuthRepository repository;

  LoginWithEmailAndPassword({required this.repository});

  @override
  Future<Either<Failure, StoraygeUser>> call(LoginParams params) async {
    return repository.loginWithEmailAndPassword(
        email: params.email, password: params.password);
  }
}
