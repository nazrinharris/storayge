import 'package:storayge/core/errors/failures.dart';
import 'package:fpdart/fpdart.dart';
import 'package:storayge/core/network/network_info.dart';
import 'package:storayge/features/cabinet/data/datasources/cabinet_local_datasource.dart';
import 'package:storayge/features/cabinet/data/datasources/cabinet_remote_datasource.dart';
import 'package:storayge/features/cabinet/data/models/shelf_model.dart';
import 'package:storayge/features/cabinet/domain/entities/shelf.dart';
import 'package:storayge/features/cabinet/domain/i_repository/i_home_repository.dart';

class HomeRepository implements IHomeRepository {
  CabinetRemoteDataSource remoteDataSource;
  CabinetLocalDataSource localDataSource;
  NetworkInfo networkInfo;

  HomeRepository({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Shelf>> getHomeData({required String uid}) async {
    if (await networkInfo.isConnected) {
      final ShelfModel retrievedShelf =
          await remoteDataSource.getHomeData(uid: uid);
      Shelf currentShelf = Shelf(
        shelfName: retrievedShelf.shelfName,
        shelfId: retrievedShelf.shelfId,
        shelfDesc: retrievedShelf.shelfDesc,
        imgPath: retrievedShelf.imgPath,
        pathName: retrievedShelf.pathName,
        containerAmount: retrievedShelf.containerAmount,
        itemAmount: retrievedShelf.itemAmount,
      );

      return Right(currentShelf);
    } else {
      return const Left(NoConnectionFailure());
    }
  }
}
