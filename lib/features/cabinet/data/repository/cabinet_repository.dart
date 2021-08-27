import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:storayge/core/errors/exceptions.dart';
import 'package:storayge/core/errors/failures.dart';
import 'package:storayge/features/cabinet/domain/entities/storayge_group.dart';

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
  Future<Either<Failure, StoraygeGroup>> getSingleStoraygeGroup({
    required String uid,
    required String storaygeGroupId,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<StoraygeGroupSnippet>>> getAllListSGSnip({
    required String uid,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final List<StoraygeGroupSnippet> sgAllListSnip =
            await remoteDataSource.getAllListSGSnipFromRemote(uid: uid);

        await localDataSource.storeAllListSGSnip(sgAllListSnip);

        return Right(sgAllListSnip);
      } on FirebaseException catch (e) {
        return Left(FirestoreFailure(message: e.message, code: e.code));
      } on StorageException catch (e) {
        return Left(StorageFailure(code: e.code, message: e.message));
      } catch (e) {
        // TODO : Add an UNEXPECTED_FAILURE code and message to the code_library
        return const Left(
          UnexpectedFailure(code: 'unexpected', message: 'unexpected'),
        );
      }
    } else {
      try {
        final List<StoraygeGroupSnippet> sgAllListSnip =
            await localDataSource.getAllListSGSnipFromLocal();

        return Right(sgAllListSnip);
      } on StorageException catch (e) {
        return Left(StorageFailure(code: e.code, message: e.message));
      } catch (e) {
        return Left(UnexpectedFailure(message: e.toString()));
      }
    }
  }
}
