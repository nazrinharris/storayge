import 'package:storayge/core/errors/failures.dart';
import 'package:fpdart/fpdart.dart';
import 'package:storayge/core/network/network_info.dart';
import 'package:storayge/features/cabinet/data/datasources/cabinet_local_datasource.dart';
import 'package:storayge/features/cabinet/data/datasources/cabinet_remote_datasource.dart';
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
}
