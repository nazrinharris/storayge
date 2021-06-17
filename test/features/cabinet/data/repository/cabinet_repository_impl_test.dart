import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storayge/features/cabinet/data/repository/cabinet_repository_impl.dart';

import '../../../../core/mock_classes/mock_utilities/mock_utilities.mocks.dart';
import '../../../../presets/entities_presets.dart';
import '../../../../presets/failures_exceptions_presets.dart';
import '../../mock_classes/mock_app_cabinet/mock_app_cabinet.mocks.dart';

void main() {
  late CabinetRepositoryImpl repository;
  late MockCabinetRemoteDataSource mockCabinetRemoteDataSource;
  late MockCabinetLocalDataSource mockCabinetLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockCabinetRemoteDataSource = MockCabinetRemoteDataSource();
    mockCabinetLocalDataSource = MockCabinetLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();

    repository = CabinetRepositoryImpl(
      remoteDataSource: mockCabinetRemoteDataSource,
      localDataSource: mockCabinetLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('getShelf', () {
    test(
      'should check if device is online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockCabinetRemoteDataSource.getShelf(
          uid: anyNamed('uid'),
          shelfId: anyNamed('shelfId'),
        )).thenAnswer((_) async => tShelfModel);
        when(mockCabinetLocalDataSource.storeShelfInLocal(
                shelfModel: anyNamed('shelfModel')))
            .thenAnswer((_) async => unit);
        // act
        repository.getShelf(
          uid: tUid,
          shelfId: tShelfId,
        );
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    runTestsOnline(() {
      test(
        'should return ShelfModel when query to remote data source is succesfull',
        () async {
          // arrange
          when(mockCabinetRemoteDataSource.getShelf(
            uid: anyNamed('uid'),
            shelfId: anyNamed('shelfId'),
          )).thenAnswer((_) async => tShelfModel);
          when(mockCabinetLocalDataSource.storeShelfInLocal(
                  shelfModel: anyNamed('shelfModel')))
              .thenAnswer((_) async => unit);
          // act
          final result = await repository.getShelf(
            uid: tUid,
            shelfId: tShelfId,
          );
          // assert
          verify(mockCabinetRemoteDataSource.getShelf(
            uid: tUid,
            shelfId: tShelfId,
          ));
          expect(result, Right(tShelf));
        },
      );

      test(
        'should cache ShelfModel locally when query to remote data source is succesfull',
        () async {
          // arrange
          when(mockCabinetRemoteDataSource.getShelf(
            uid: anyNamed('uid'),
            shelfId: anyNamed('shelfId'),
          )).thenAnswer((_) async => tShelfModel);
          when(mockCabinetLocalDataSource.storeShelfInLocal(
                  shelfModel: anyNamed('shelfModel')))
              .thenAnswer((_) async => unit);
          // act
          await repository.getShelf(
            uid: tUid,
            shelfId: tShelfId,
          );
          // assert
          verify(mockCabinetRemoteDataSource.getShelf(
            uid: tUid,
            shelfId: tShelfId,
          ));
          verify(mockCabinetLocalDataSource.storeShelfInLocal(
              shelfModel: tShelfModel));
        },
      );

      test(
        'should return FirestoreFailure when the query to Firebase fails',
        () async {
          // arrange
          when(mockCabinetRemoteDataSource.getShelf(
            uid: anyNamed('uid'),
            shelfId: anyNamed('shelfId'),
          )).thenThrow(testFirebaseException);
          // act
          final result = await repository.getShelf(
            uid: tUid,
            shelfId: tShelfId,
          );
          // assert
          verify(mockCabinetRemoteDataSource.getShelf(
            uid: tUid,
            shelfId: tShelfId,
          ));
          verifyZeroInteractions(mockCabinetLocalDataSource);
          expect(result, Left(testFirestoreFailure));
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return last locally stored data when data is present',
        () async {
          // arrange
          when(mockCabinetLocalDataSource.getShelfFromLocal(shelfId: tShelfId))
              .thenAnswer((_) async => tShelfModel);
          // act
          final result = await repository.getShelf(
            uid: tUid,
            shelfId: tShelfId,
          );
          // assert
          verifyZeroInteractions(mockCabinetRemoteDataSource);
          verify(
              mockCabinetLocalDataSource.getShelfFromLocal(shelfId: tShelfId));
          expect(result, Right(tShelf));
        },
      );

      test(
        'should return CacheFailure when there is no stored Shelf',
        () async {
          // arrange
          when(mockCabinetLocalDataSource.getShelfFromLocal(shelfId: tShelfId))
              .thenThrow(testCacheException);
          // act
          final result = await repository.getShelf(
            uid: tUid,
            shelfId: tShelfId,
          );
          // assert
          verifyZeroInteractions(mockCabinetRemoteDataSource);
          verify(
              mockCabinetLocalDataSource.getShelfFromLocal(shelfId: tShelfId));
          expect(result, Left(testCacheFailure));
        },
      );
    });
  });

  group('storeShelf', () {
    // TODO : Create tests
  });
}
