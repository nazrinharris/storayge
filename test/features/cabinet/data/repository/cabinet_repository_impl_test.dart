import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storayge/core/network/network_info.dart';
import 'package:storayge/features/cabinet/data/datasources/cabinet_local_datasource.dart';
import 'package:storayge/features/cabinet/data/datasources/cabinet_remote_datasource.dart';
import 'package:storayge/features/cabinet/data/models/storayge_group_model.dart';
import 'package:storayge/features/cabinet/data/repository/cabinet_repository.dart';

import '../../../../presets/entities_presets.dart';
import '../../../../presets/failures_exceptions_presets.dart';

class MockCabinetRemoteDataSource extends Mock
    implements CabinetRemoteDataSource {}

class MockCabinetLocalDataSource extends Mock
    implements CabinetLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

class FakeStoraygeGroupModel extends Fake implements StoraygeGroupModel {}

void main() {
  late CabinetRepository repository;
  late MockCabinetRemoteDataSource mockCabinetRemoteDataSource;
  late MockCabinetLocalDataSource mockCabinetLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockCabinetRemoteDataSource = MockCabinetRemoteDataSource();
    mockCabinetLocalDataSource = MockCabinetLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();

    repository = CabinetRepository(
      remoteDataSource: mockCabinetRemoteDataSource,
      localDataSource: mockCabinetLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  setUpAll(() {
    registerFallbackValue(FakeStoraygeGroupModel());
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }
}
