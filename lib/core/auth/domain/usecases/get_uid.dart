import 'package:fpdart/fpdart.dart';
import '../repository/auth_repository.dart';
import '../../../errors/failures.dart';
import '../../../usecases/usecase.dart';

class GetUid implements Usecase<String, NoParams> {
  final AuthRepository repository;

  GetUid({required this.repository});

  @override
  Future<Either<Failure, String>> call(NoParams params) {
    return repository.getUid();
  }
}
