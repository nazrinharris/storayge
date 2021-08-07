import 'package:fpdart/fpdart.dart';

import '../../../errors/failures.dart';
import '../../../usecases/params.dart';
import '../../../usecases/usecase.dart';
import '../entities/storayge_user.dart';
import '../repository/auth_repository.dart';

class GetStoraygeUserDataFromRemote
    implements Usecase<StoraygeUser, UidParams> {
  final AuthRepository repository;

  GetStoraygeUserDataFromRemote({required this.repository});

  @override
  Future<Either<Failure, StoraygeUser>> call(UidParams params) async {
    return repository.getStoraygeUserDataFromRemote(uid: params.uid);
  }
}
