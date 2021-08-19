import 'package:firebase_core/firebase_core.dart';
import 'package:fpdart/fpdart.dart';
import 'package:storayge/core/errors/failures.dart';
import 'package:storayge/features/cabinet/domain/entities/storayge_group.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/i_repository/i_cabinet_repository.dart';
import '../datasources/cabinet_local_datasource.dart';
import '../datasources/cabinet_remote_datasource.dart';

class CabinetRepository implements ICabinetRepository {
  final CabinetRemoteDataSource remoteDataSource;
  final CabinetLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  CabinetRepository({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Group>> getSingleStoraygeGroup({
    required String uid,
    required String storaygeGroupId,
  }) {
    // TODO: implement getSingleStoraygeGroup
    throw UnimplementedError();
  }
}
