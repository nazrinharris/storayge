import 'package:fpdart/fpdart.dart';

import '../../../errors/failures.dart';
import '../../../usecases/params.dart';
import '../../../usecases/usecase.dart';
import '../entities/storayge_user.dart';
import '../repository/auth_repository.dart';

class RegisterWithEmailAndPassword
    implements Usecase<StoraygeUser, RegisterParams> {
  final AuthRepository repository;

  RegisterWithEmailAndPassword({required this.repository});

  @override
  Future<Either<Failure, StoraygeUser>> call(RegisterParams params) {
    return repository.registerWithEmailAndPassword(
      email: params.email,
      password: params.password,
      username: params.username,
    );
  }
}
