// ignore_for_file: prefer_const_constructors

import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storayge/core/auth/data/repository/auth_repository_impl.dart';
import 'package:storayge/core/errors/exceptions.dart';
import 'package:storayge/core/errors/failures.dart';
import '../../../../presets/entities_presets.dart';
import '../../../../presets/failures_exceptions_presets.dart';
import '../../../mock_classes/mock_app_auth/mock_app_auth.mocks.dart';
import '../../../mock_classes/mock_utilities/mock_utilities.mocks.dart';

void main() {
  late AuthRepositoryImpl repository;
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;
  late MockAuthLocalDataSource mockAuthLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    mockAuthLocalDataSource = MockAuthLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = AuthRepositoryImpl(
      remoteDataSource: mockAuthRemoteDataSource,
      localDataSource: mockAuthLocalDataSource,
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
        'should return StoraygeUserModel when the call to remote data source is succesfull',
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
        'should cache StoraygeUserModel locally when the call to remote data source is succesful',
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
        'should return FirestoreFailure when the query to Firebase fails',
        () async {
          // arrange
          when(mockAuthRemoteDataSource.getStoraygeUserDataFromRemote(
                  uid: anyNamed('uid')))
              .thenThrow(testFirebaseException);
          // act
          final result =
              await repository.getStoraygeUserDataFromRemote(uid: tUid);
          // assert
          verify(mockAuthRemoteDataSource.getStoraygeUserDataFromRemote(
              uid: tUid));
          verifyZeroInteractions(mockAuthLocalDataSource);
          expect(result, Left(testFirestoreFailure));
        },
      );
    });

    runTestsOffline(() {
      // setUp(() {
      //   when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      // });

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
              .thenThrow(testCacheException);
          // act
          final result =
              await repository.getStoraygeUserDataFromRemote(uid: tUid);
          // assert
          verifyZeroInteractions(mockAuthRemoteDataSource);
          verify(mockAuthLocalDataSource.getCachedStoraygeUser());
          expect(result, equals(Left(testCacheFailure)));
        },
      );
    });
  });

  group('loginWithEmailAndPassword', () {
    test(
      'should check if device is online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockAuthRemoteDataSource.loginWithEmailAndPassword(
          email: anyNamed('email'),
          password: anyNamed('password'),
        )).thenAnswer((_) async => tStoraygeUserModel);
        // act
        repository.loginWithEmailAndPassword(
            email: tEmail, password: tPassword);
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    runTestsOnline(() {
      test(
        'should return StoraygeUser with current user details when succesful login',
        () async {
          // arrange
          when(mockAuthRemoteDataSource.loginWithEmailAndPassword(
            email: anyNamed('email'),
            password: anyNamed('password'),
          )).thenAnswer((_) async => tStoraygeUserModel);
          // act
          final result = await repository.loginWithEmailAndPassword(
              email: tEmail, password: tPassword);
          // assert
          expect(result, equals(Right(tStoraygeUser)));
        },
      );

      test(
        'should cache StoraygeUser with current user details when succesful login',
        () async {
          // arrange
          when(mockAuthRemoteDataSource.loginWithEmailAndPassword(
            email: anyNamed('email'),
            password: anyNamed('password'),
          )).thenAnswer((_) async => tStoraygeUserModel);
          // act
          await repository.loginWithEmailAndPassword(
              email: tEmail, password: tPassword);
          // assert
          verify(mockAuthLocalDataSource.cacheStoraygeUser(tStoraygeUserModel));
        },
      );

      test(
        'should return FirebaseAuthFailure when login fails',
        () async {
          // arrange
          when(mockAuthRemoteDataSource.loginWithEmailAndPassword(
            email: anyNamed('email'),
            password: anyNamed('password'),
          )).thenThrow(testFirebaseAuthException);
          // act
          final result = await repository.loginWithEmailAndPassword(
              email: tEmail, password: tPassword);
          // assert
          expect(result, equals(Left(testFirebaseAuthFailure)));
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return ServerFailure when there is no internet connection',
        () async {
          // act
          final result = await repository.loginWithEmailAndPassword(
              email: tEmail, password: tPassword);
          // assert
          expect(result, equals(Left(testServerFailure)));
        },
      );
    });
  });

  group('registerWithEmailAndPassword', () {
    test(
      'should check if device is online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockAuthRemoteDataSource.registerWithEmailAndPassword(
          email: anyNamed('email'),
          password: anyNamed('password'),
          username: anyNamed('username'),
        )).thenAnswer((_) async => tStoraygeUserModel);
        // act
        repository.registerWithEmailAndPassword(
          email: tEmail,
          password: tPassword,
          username: tUsername,
        );
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    runTestsOnline(() {
      test(
        'should return StoraygeUser with current user details when succesful register',
        () async {
          // arrange
          when(mockAuthRemoteDataSource.registerWithEmailAndPassword(
            email: anyNamed('email'),
            password: anyNamed('password'),
            username: anyNamed('username'),
          )).thenAnswer((_) async => tStoraygeUserModel);
          // act
          final result = await repository.registerWithEmailAndPassword(
            email: tEmail,
            password: tPassword,
            username: tUsername,
          );
          // assert
          expect(result, equals(Right(tStoraygeUser)));
        },
      );

      test(
        'should cache StoraygeUser with current user details when succesful register',
        () async {
          // arrange
          when(mockAuthRemoteDataSource.registerWithEmailAndPassword(
            email: anyNamed('email'),
            password: anyNamed('password'),
            username: anyNamed('username'),
          )).thenAnswer((_) async => tStoraygeUserModel);
          // act
          await repository.registerWithEmailAndPassword(
            email: tEmail,
            password: tPassword,
            username: tUsername,
          );
          // assert
          verify(mockAuthLocalDataSource.cacheStoraygeUser(tStoraygeUserModel));
        },
      );

      test(
        'should return FirebaseAuthFailure when registration fails',
        () async {
          // arrange
          when(mockAuthRemoteDataSource.registerWithEmailAndPassword(
            email: anyNamed('email'),
            password: anyNamed('password'),
            username: anyNamed('username'),
          )).thenThrow(testFirebaseAuthException);
          // act
          final result = await repository.registerWithEmailAndPassword(
            email: tEmail,
            password: tPassword,
            username: tUsername,
          );
          // assert
          expect(result, equals(Left(testFirebaseAuthFailure)));
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return ServerFailure when there is no internet connection',
        () async {
          // act
          final result = await repository.registerWithEmailAndPassword(
            email: tEmail,
            password: tPassword,
            username: tUsername,
          );
          // assert
          expect(result, equals(Left(testServerFailure)));
        },
      );
    });
  });

  group('getUid', () {
    test(
      'should return proper uid when user is logged in',
      () async {
        // arrange
        when(mockAuthRemoteDataSource.getUid()).thenAnswer((_) async => tUid);
        // act
        final result = await repository.getUid();
        // assert
        expect(result, equals(Right(tUid)));
      },
    );

    test(
      'should return UserFailure when no user is logged in',
      () async {
        // arrange
        when(mockAuthRemoteDataSource.getUid())
            .thenThrow(testUserNotFoundException);
        // act
        final result = await repository.getUid();
        // assert
        expect(result, equals(Left(testUserFailure)));
      },
    );
  });

  group('signOut', () {
    test(
      'should return unit when user is succesfully signed out',
      () async {
        // arrange
        when(mockAuthRemoteDataSource.signOut()).thenAnswer((_) async => unit);
        // act
        final result = await repository.signOut();
        // assert
        expect(result, equals(Right(unit)));
      },
    );

    test(
      'should return FirebaseAuthFailure when sign out fails',
      () async {
        // arrange
        when(mockAuthRemoteDataSource.signOut())
            .thenThrow(testFirebaseAuthException);
        // act
        final result = await repository.signOut();
        // assert
        expect(result, equals(Left(testFirebaseAuthFailure)));
      },
    );
  });
}
