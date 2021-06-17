import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/params.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/cabinet_repository.dart';

class StoreShelf implements Usecase<Unit, ShelfParams> {
  final CabinetRepository cabinetRepository;

  StoreShelf(this.cabinetRepository);

  @override
  Future<Either<Failure, Unit>> call(ShelfParams params) {
    return cabinetRepository.storeShelf(shelf: params.shelf!, uid: params.uid);
  }
}
