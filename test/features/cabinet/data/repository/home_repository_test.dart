import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

import 'package:mocktail/mocktail.dart';
import 'package:storayge/core/network/network_info.dart';
import 'package:storayge/features/cabinet/data/datasources/cabinet_local_datasource.dart';
import 'package:storayge/features/cabinet/data/datasources/cabinet_remote_datasource.dart';
import 'package:storayge/features/cabinet/data/repository/home_repository.dart';

import '../../../../presets/entities_presets.dart';

class MockCabinetRemoteDataSource extends Mock
    implements CabinetRemoteDataSource {}

class MockCabinetLocalDataSource extends Mock
    implements CabinetLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late HomeRepository repository;
  late MockCabinetRemoteDataSource mockRemoteDataSource;
  late MockCabinetLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockCabinetRemoteDataSource();
    mockLocalDataSource = MockCabinetLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();

    repository = HomeRepository(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  setUpAll(() {});

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }
}
