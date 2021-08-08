import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../entities/shelf.dart';

abstract class ICabinetRepository {
  Future<Either<Failure, Shelf>> getShelf({
    required String uid,
    required String shelfId,
  });

  Future<Either<Failure, Unit>> storeShelf({
    required Shelf shelf,
    required String uid,
  });
}
