// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:storayge/core/network/network_info.dart';
import 'package:storayge/features/cabinet/data/datasources/cabinet_local_datasource.dart';
import 'package:storayge/features/cabinet/data/datasources/cabinet_remote_datasource.dart';
import 'package:storayge/features/cabinet/data/repository/cabinet_repository.dart';
import 'package:storayge/features/cabinet/domain/entities/storayge_group.dart';

import '../../../../presets/entities_presets.dart';
import '../../../../presets/failures_exceptions_presets.dart';

class MockCabinetRemoteDataSource extends Mock
    implements CabinetRemoteDataSource {}

class MockCabinetLocalDataSource extends Mock
    implements CabinetLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

class FakeStoraygeGroupAllListSnippet extends Fake
    implements List<StoraygeGroupSnippet> {}

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

    registerFallbackValue(FakeStoraygeGroupAllListSnippet());
  });

  group('CabinetRepository', () {
    group('[online]', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      group('getAllListSGSnip() ->', () {
        test(
          'should check if device is online',
          () async {
            // arrange
            when(() => mockCabinetRemoteDataSource.getAllListSGSnipFromRemote(
                    uid: any(named: "uid")))
                .thenAnswer((_) async => tStoraygeGroupAllListSnipTwo);
            when(() => mockCabinetLocalDataSource.storeAllListSGSnip(any()))
                .thenAnswer((_) async => unit);
            // act
            await repository.getAllListSGSnip(uid: tUid);
            // assert
            verify(() => mockNetworkInfo.isConnected);
          },
        );

        test(
          'should return Right(List<StoraygeUserSnippet>) when the call to the remote is succesfull',
          () async {
            // arrange
            when(() => mockCabinetRemoteDataSource.getAllListSGSnipFromRemote(
                    uid: any(named: "uid")))
                .thenAnswer((_) async => tStoraygeGroupAllListSnipTwo);
            when(() => mockCabinetLocalDataSource.storeAllListSGSnip(any()))
                .thenAnswer((_) async => unit);
            // act
            final result = await repository.getAllListSGSnip(uid: tUid);
            // assert
            verify(() => mockCabinetRemoteDataSource.getAllListSGSnipFromRemote(
                uid: any(named: "uid")));
            expect(result, Right(tStoraygeGroupAllListSnipTwo));
          },
        );

        test(
          'should store retrieved List<StoraygeUserSnippet>',
          () async {
            // arrange
            when(() => mockCabinetRemoteDataSource.getAllListSGSnipFromRemote(
                    uid: any(named: "uid")))
                .thenAnswer((_) async => tStoraygeGroupAllListSnipTwo);
            when(() => mockCabinetLocalDataSource.storeAllListSGSnip(any()))
                .thenAnswer((_) async => unit);
            // act
            final result = await repository.getAllListSGSnip(uid: tUid);
            // assert
            verify(() => mockCabinetLocalDataSource.storeAllListSGSnip(any()));
            expect(result, Right(tStoraygeGroupAllListSnipTwo));
          },
        );
        test(
          'should return Left(FirestoreFailure) with code and message when the call to remote throws an exception',
          () async {
            // arrange
            when(() => mockCabinetRemoteDataSource.getAllListSGSnipFromRemote(
                uid: any(named: "uid"))).thenThrow(tFirebaseException);
            when(() => mockCabinetLocalDataSource.storeAllListSGSnip(any()))
                .thenAnswer((_) async => unit);
            // act
            final result = await repository.getAllListSGSnip(uid: tUid);
            // assert
            expect(result, Left(tFirestoreFailure));
          },
        );
        test(
          'should return Left(StorageFailure) with code and message when storing allListSGSnip throws an exception',
          () async {
            // arrange
            when(() => mockCabinetRemoteDataSource.getAllListSGSnipFromRemote(
                uid: any(named: "uid"))).thenThrow(tStorageException);
            when(() => mockCabinetLocalDataSource.storeAllListSGSnip(any()))
                .thenAnswer((_) async => unit);
            // act
            final result = await repository.getAllListSGSnip(uid: tUid);
            // assert
            expect(result, Left(tStorageFailure));
          },
        );
      });
    });

    group('[offline]', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      group('getAllListSGSnip() ->', () {
        test(
          'should check if device is offline',
          () async {
            // arrange
            when(() => mockCabinetLocalDataSource.getAllListSGSnipFromLocal())
                .thenAnswer((_) async => tStoraygeGroupAllListSnipTwo);
            // act
            await repository.getAllListSGSnip(uid: tUid);
            // assert
            verify(() => mockNetworkInfo.isConnected);
          },
        );

        test(
          'should return Right(List<StoraygeGroupSnippet>) when the call to local is succesfull',
          () async {
            // arrange
            when(() => mockCabinetLocalDataSource.getAllListSGSnipFromLocal())
                .thenAnswer((_) async => tStoraygeGroupAllListSnipTwo);
            // act
            final result = await repository.getAllListSGSnip(uid: tUid);
            // assert
            expect(result, Right(tStoraygeGroupAllListSnipTwo));
          },
        );

        test(
          'should return Left(StorageFailure) when the call to local fails',
          () async {
            // arrange
            when(() => mockCabinetLocalDataSource.getAllListSGSnipFromLocal())
                .thenThrow(tStorageException);
            // act
            final result = await repository.getAllListSGSnip(uid: tUid);
            // assert
            expect(result, Left(tStorageFailure));
          },
        );
        //todo: complete this test
        test(
          'should return Left(UnexpectedFailure) when an unexpected exception is thrown',
          () async {
            // arrange

            // act

            // assert
          },
        );
      });
    });
  });
}
