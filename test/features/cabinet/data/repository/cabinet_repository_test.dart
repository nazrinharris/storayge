// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:storayge/core/network/network_info.dart';
import 'package:storayge/features/cabinet/data/datasources/cabinet_local_datasource.dart';
import 'package:storayge/features/cabinet/data/datasources/cabinet_remote_datasource.dart';
import 'package:storayge/features/cabinet/data/repository/cabinet_repository.dart';
import 'package:storayge/features/cabinet/domain/entities/storayge_group.dart';

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

  late List<StoraygeGroupSnippet> tStoraygeGroupAllListSnipTwo;

  late StoraygeGroupSnippet tStoraygeGroupSnippet;
  late StoraygeGroupSnippet tStoraygeGroupSnippet2;

  setUp(() {
    mockCabinetRemoteDataSource = MockCabinetRemoteDataSource();
    mockCabinetLocalDataSource = MockCabinetLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();

    repository = CabinetRepository(
      remoteDataSource: mockCabinetRemoteDataSource,
      localDataSource: mockCabinetLocalDataSource,
      networkInfo: mockNetworkInfo,
    );

    tStoraygeGroupSnippet = StoraygeGroupSnippet(
      sgId: tsgIdSnip,
      sgName: tsgNameSnip,
      sgDesc: tsgDescSnip,
      sgImgPath: tsgImgPathSnip,
    );

    tStoraygeGroupSnippet2 = StoraygeGroupSnippet(
      sgId: tsgIdSnip2,
      sgName: tsgNameSnip2,
      sgDesc: tsgDescSnip2,
      sgImgPath: tsgImgPathSnip2,
    );

    tStoraygeGroupAllListSnipTwo = [
      tStoraygeGroupSnippet,
      tStoraygeGroupSnippet2,
    ];

    registerFallbackValue(FakeStoraygeGroupAllListSnippet);
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
      });
    });
  });
}

const String tsgNameSnip = 'test_storayge_group_name_snip';
const String tsgIdSnip = 'test_storayge_group_id_snip';
const String tsgDescSnip = 'test_storayge_group_desc_snip';
const String tsgImgPathSnip = 'test_storayge_group_img_path_snip';

const String tsgNameSnip2 = '2_test_storayge_group_name_snip';
const String tsgIdSnip2 = '2_test_storayge_group_id_snip';
const String tsgDescSnip2 = '2_test_storayge_group_desc_snip';
const String tsgImgPathSnip2 = '2_test_storayge_group_img_path_snip';

const String tUid = 'test_uid';
