import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:storayge/core/network/network_info.dart';
import 'package:storayge/features/cabinet/data/datasources/cabinet_local_datasource.dart';
import 'package:storayge/features/cabinet/data/datasources/cabinet_remote_datasource.dart';
import 'package:storayge/features/cabinet/data/repository/home_repository_impl.dart';

class MockCabinetRemoteDataSource extends Mock
    implements CabinetRemoteDataSource {}

class MockCabinetLocalDataSource extends Mock
    implements CabinetLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late HomeRepositoryImpl repository;
  late MockCabinetRemoteDataSource mockRemoteDataSource;
  late MockCabinetLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockCabinetRemoteDataSource();
    mockLocalDataSource = MockCabinetLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();

    repository = HomeRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  setUpAll(() {});

  group('getHomeData', () {
    test(
      'should check if device is online',
      () async {
        // arrange
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        // act

        // assert
      },
    );
  });
}
