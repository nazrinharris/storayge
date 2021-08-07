import 'package:storayge/core/errors/failures.dart';
import 'package:fpdart/src/either.dart';
import 'package:storayge/core/network/network_info.dart';
import 'package:storayge/features/cabinet/data/datasources/cabinet_local_datasource.dart';
import 'package:storayge/features/cabinet/data/datasources/cabinet_remote_datasource.dart';
import 'package:storayge/features/cabinet/domain/entities/shelf.dart';
import 'package:storayge/features/cabinet/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  CabinetRemoteDataSource remoteDataSource;
  CabinetLocalDataSource localDataSource;
  NetworkInfo networkInfo;

  HomeRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Shelf>> getHomeData() {
    throw UnimplementedError();
  }
}
