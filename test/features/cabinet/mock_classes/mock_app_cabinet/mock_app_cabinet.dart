import 'package:mockito/annotations.dart';
import 'package:storayge/features/cabinet/data/datasources/cabinet_local_datasource.dart';
import 'package:storayge/features/cabinet/data/datasources/cabinet_remote_datasource.dart';
import 'package:storayge/features/cabinet/domain/repository/cabinet_repository.dart';

@GenerateMocks([
  CabinetRepository,
  CabinetLocalDataSource,
  CabinetRemoteDataSource,
])
class MockAppCabinet {}
