import '../repository/auth_repository.dart';
import '../../../errors/failures.dart';
import 'package:fpdart/fpdart.dart';
import '../../../usecases/usecase.dart';

class SignOut implements Usecase<Unit, NoParams> {
  final AuthRepository repository;

  SignOut(this.repository);

  @override
  Future<Either<Failure, Unit>> call(NoParams params) {
    return repository.signOut();
  }
}
