import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storayge/core/auth/data/models/storayge_user_model.dart';
import 'package:storayge/core/auth/data/repository/auth_repository_impl.dart';
import 'package:storayge/core/auth/domain/entities/storayge_user.dart';
import 'package:storayge/core/errors/exceptions.dart';
import 'package:storayge/core/errors/failures.dart';
import '../../../mock_classes/mock_app_auth/mock_app_auth.mocks.dart';
import '../../../mock_classes/mock_utilities/mock_utilities.mocks.dart';

void main() {
  late AuthRepositoryImpl repository;
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;
  late MockAuthLocalDataSource mockAuthLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  late StoraygeUserModel tStoraygeUserModel;
  late StoraygeUser tStoraygeUser;

  const String tUid = 'test_uid';
  const String tEmail = 'test@test.com';
  const String tUsername = 'test_username';

  setUp(() {
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    mockAuthLocalDataSource = MockAuthLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = AuthRepositoryImpl(
      remoteDataSource: mockAuthRemoteDataSource,
      localDataSource: mockAuthLocalDataSource,
      networkInfo: mockNetworkInfo,
    );

    tStoraygeUserModel = StoraygeUserModel(
      uid: tUid,
      username: tUsername,
      email: tEmail,
    );

    tStoraygeUser = tStoraygeUserModel;
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

  group('getStoraygeUserDataFromRemote', () {
    test(
      'should check if device is online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockAuthRemoteDataSource.getStoraygeUserDataFromRemote(
                uid: anyNamed('uid')))
            .thenAnswer((_) async => tStoraygeUserModel);
        // act
        repository.getStoraygeUserDataFromRemote(uid: tUid);
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is succesfull',
        () async {
          // arrange
          when(mockAuthRemoteDataSource.getStoraygeUserDataFromRemote(
                  uid: anyNamed('uid')))
              .thenAnswer((_) async => tStoraygeUserModel);
          // act
          final result =
              await repository.getStoraygeUserDataFromRemote(uid: tUid);
          // assert
          verify(mockAuthRemoteDataSource.getStoraygeUserDataFromRemote(
              uid: tUid));
          expect(result, Right(tStoraygeUser));
        },
      );

      test(
        'should cache StoraygeUser locally when the call to remote data source is succesful',
        () async {
          // arrange
          when(mockAuthRemoteDataSource.getStoraygeUserDataFromRemote(
                  uid: anyNamed('uid')))
              .thenAnswer((_) async => tStoraygeUserModel);
          // act
          await repository.getStoraygeUserDataFromRemote(uid: tUid);
          // assert
          verify(mockAuthRemoteDataSource.getStoraygeUserDataFromRemote(
              uid: tUid));
          verify(mockAuthLocalDataSource.cacheStoraygeUser(tStoraygeUserModel));
        },
      );

      test(
        'should return ServerFailure when the call to remote data source fails',
        () async {
          // arrange
          when(mockAuthRemoteDataSource.getStoraygeUserDataFromRemote(
                  uid: anyNamed('uid')))
              .thenThrow(FirestoreException('error'));
          // act
          final result =
              await repository.getStoraygeUserDataFromRemote(uid: tUid);
          // assert
          verify(mockAuthRemoteDataSource.getStoraygeUserDataFromRemote(
              uid: tUid));
          verifyZeroInteractions(mockAuthLocalDataSource);
          expect(result, Left(FirestoreFailure('error')));
        },
      );
    });

    runTestsOffline(() {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test(
        'should return last locally cached data when the cached data is present',
        () async {
          // arrange
          when(mockAuthLocalDataSource.getCachedStoraygeUser())
              .thenAnswer((_) async => tStoraygeUserModel);
          // act
          final result =
              await repository.getStoraygeUserDataFromRemote(uid: tUid);
          // assert
          verifyZeroInteractions(mockAuthRemoteDataSource);
          verify(mockAuthLocalDataSource.getCachedStoraygeUser());
          expect(result, equals(Right(tStoraygeUser)));
        },
      );

      test(
        'should return CacheFailure when there is no cached StoraygeUser',
        () async {
          // arrange
          when(mockAuthLocalDataSource.getCachedStoraygeUser())
              .thenThrow(CacheException());
          // act
          final result =
              await repository.getStoraygeUserDataFromRemote(uid: tUid);
          // assert
          verifyZeroInteractions(mockAuthRemoteDataSource);
          verify(mockAuthLocalDataSource.getCachedStoraygeUser());
          expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });
}
