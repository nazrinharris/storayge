import 'package:fpdart/fpdart.dart';
import 'package:storayge/core/errors/failures.dart';
import 'package:storayge/features/cabinet/domain/entities/shelf.dart';

abstract class HomeRepository {
  Future<Either<Failure, Shelf>> getHomeData();
}
