import 'package:fpdart/fpdart.dart';
import 'package:storayge/features/cabinet/domain/entities/storayge_group.dart';
import '../../../../core/errors/failures.dart';

abstract class ICabinetRepository {
  Future<Either<Failure, Group>> getSingleStoraygeGroup({
    required String uid,
    required String storaygeGroupId,
  });
}
