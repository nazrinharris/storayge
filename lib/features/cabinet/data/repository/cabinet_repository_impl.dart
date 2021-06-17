import 'package:firebase_core/firebase_core.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/cabinet_local_datasource.dart';
import '../datasources/cabinet_remote_datasource.dart';
import '../models/shelf_model.dart';
import '../../domain/entities/shelf.dart';
import '../../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repository/cabinet_repository.dart';

class CabinetRepositoryImpl implements CabinetRepository {
  final CabinetRemoteDataSource remoteDataSource;
  final CabinetLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  CabinetRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Shelf>> getShelf({
    required String uid,
    required String shelfId,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final resultModel = await remoteDataSource.getShelf(
          uid: uid,
          shelfId: shelfId,
        );
        final shelf = Shelf(
            shelfName: resultModel.shelfName,
            shelfId: resultModel.shelfId,
            shelfDesc: resultModel.shelfDesc,
            imgPath: resultModel.imgPath,
            pathName: resultModel.pathName,
            containerAmount: resultModel.containerAmount,
            itemAmount: resultModel.itemAmount);
        await localDataSource.storeShelfInLocal(shelfModel: resultModel);
        return Right(shelf);
      } on FirebaseException catch (e) {
        return Left(FirestoreFailure(
          code: e.code,
          message: e.message,
        ));
      } on AppException {
        return const Left(
            ServerFailure(code: 'UNKNOWN', message: 'Weird error occured'));
      }
    } else {
      try {
        final ShelfModel localShelfModel =
            await localDataSource.getShelfFromLocal(shelfId: shelfId);
        final shelf = Shelf(
          shelfName: localShelfModel.shelfName,
          shelfId: localShelfModel.shelfId,
          shelfDesc: localShelfModel.shelfDesc,
          imgPath: localShelfModel.imgPath,
          pathName: localShelfModel.pathName,
          containerAmount: localShelfModel.containerAmount,
          itemAmount: localShelfModel.itemAmount,
        );
        return Right(shelf);
      } on CacheException catch (e) {
        return const Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> storeShelf({
    required Shelf shelf,
    required String uid,
  }) async {
    try {
      final ShelfModel shelfModel = ShelfModel(
        shelfName: shelf.shelfName,
        shelfId: shelf.shelfId,
        shelfDesc: shelf.shelfDesc,
        imgPath: shelf.imgPath,
        pathName: shelf.pathName,
        containerAmount: shelf.containerAmount,
        itemAmount: shelf.itemAmount,
      );
      await remoteDataSource.storeShelfInRemote(
          shelfModel: shelfModel, uid: uid);

      await localDataSource.storeShelfInLocal(shelfModel: shelfModel);

      return const Right(unit);
    } on CacheException catch (e) {
      return const Left(CacheFailure());
    } catch (e) {
      // TODO: Create Failures for unexpected failures and change this CacheFailure to said failure.
      return const Left(CacheFailure());
    }
  }
}
