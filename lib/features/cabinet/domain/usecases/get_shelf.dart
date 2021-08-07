import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/params.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/shelf.dart';
import '../repository/cabinet_repository.dart';

class GetShelf implements Usecase<Shelf, ShelfParams> {
  final CabinetRepository repository;

  GetShelf({required this.repository});

  @override
  Future<Either<Failure, Shelf>> call(ShelfParams params) {
    return repository.getShelf(
      uid: params.uid,
      shelfId: params.shelfId,
    );
  }
}
