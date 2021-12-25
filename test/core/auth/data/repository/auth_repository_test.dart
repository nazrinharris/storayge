// ignore_for_file: prefer_const_constructors
// ignore_for_file: avoid_implementing_value_types

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:storayge/core/auth/data/datasources/auth_local_datasource.dart';
import 'package:storayge/core/auth/data/datasources/auth_remote_datasource.dart';
import 'package:storayge/core/auth/data/models/storayge_user_model.dart';
import 'package:storayge/core/auth/data/repository/auth_repository.dart';
import 'package:storayge/core/network/network_info.dart';

import '../../../../presets/entities_presets.dart';
import '../../../../presets/failures_exceptions_presets.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

class FakeStoraygeUserModel extends Fake implements StoraygeUserModel {}

void main() {
  late AuthRepository repository;
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;
  late MockAuthLocalDataSource mockAuthLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    mockAuthLocalDataSource = MockAuthLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = AuthRepository(
      remoteDataSource: mockAuthRemoteDataSource,
      localDataSource: mockAuthLocalDataSource,
      networkInfo: mockNetworkInfo,
    );

    when(() => mockAuthLocalDataSource.storeStoraygeUser(any()))
        .thenAnswer((_) async => Future.value());
  });

  setUpAll(() {
    registerFallbackValue(FakeStoraygeUserModel());
  });

  group('AuthRepository', () {
    group('getStoraygeUserData() ->', () {
      group('[online]', () {
        setUp(() {
          when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        });

        test(
          'should check if device is online',
          () async {
            // arrange
            when(() => mockNetworkInfo.isConnected)
                .thenAnswer((_) async => true);
            when(() => mockAuthRemoteDataSource.getStoraygeUserDataFromRemote(
                    uid: any(named: 'uid')))
                .thenAnswer((_) async => tStoraygeUserModel);
            // act
            repository.getStoraygeUserData(uid: tUid);
            // assert
            verify(() => mockNetworkInfo.isConnected);
          },
        );

        test(
          'should return StoraygeUserModel when the call to remote data source is succesfull',
          () async {
            // arrange
            when(() => mockAuthRemoteDataSource.getStoraygeUserDataFromRemote(
                    uid: any(named: 'uid')))
                .thenAnswer((_) async => tStoraygeUserModel);
            // act
            final result = await repository.getStoraygeUserData(uid: tUid);
            // assert
            verify(() => mockAuthRemoteDataSource.getStoraygeUserDataFromRemote(
                uid: tUid));
            expect(result, Right(tStoraygeUser));
          },
        );

        test(
          'should cache StoraygeUserModel locally when the call to remote data source is succesful',
          () async {
            // arrange
            when(() => mockAuthRemoteDataSource.getStoraygeUserDataFromRemote(
                    uid: any(named: 'uid')))
                .thenAnswer((_) async => tStoraygeUserModel);
            // act
            await repository.getStoraygeUserData(uid: tUid);
            // assert
            verify(() => mockAuthRemoteDataSource.getStoraygeUserDataFromRemote(
                uid: tUid));
            verify(() =>
                mockAuthLocalDataSource.storeStoraygeUser(tStoraygeUserModel));
          },
        );

        test(
          'should return FirestoreFailure when the query to Firebase fails',
          () async {
            // arrange
            when(() => mockAuthRemoteDataSource.getStoraygeUserDataFromRemote(
                uid: any(named: 'uid'))).thenThrow(tFirebaseException);
            // act
            final result = await repository.getStoraygeUserData(uid: tUid);
            // assert
            verify(() => mockAuthRemoteDataSource.getStoraygeUserDataFromRemote(
                uid: tUid));
            verifyZeroInteractions(mockAuthLocalDataSource);
            expect(result, Left(tFirestoreFailure));
          },
        );
      });
    });

    group('getStoraygeUserData() ->', () {
      group('[offline]', () {
        setUp(() {
          when(() => mockNetworkInfo.isConnected)
              .thenAnswer((_) async => false);
        });

        test(
          'should return last locally cached data when the cached data is present',
          () async {
            // arrange
            when(() => mockAuthLocalDataSource.getCachedStoraygeUser())
                .thenAnswer((_) async => tStoraygeUserModel);
            // act
            final result = await repository.getStoraygeUserData(uid: tUid);
            // assert
            verifyZeroInteractions(mockAuthRemoteDataSource);
            verify(() => mockAuthLocalDataSource.getCachedStoraygeUser());
            expect(result, equals(Right(tStoraygeUser)));
          },
        );

        test(
          'should return CacheFailure when there is no cached StoraygeUser',
          () async {
            // arrange
            when(() => mockAuthLocalDataSource.getCachedStoraygeUser())
                .thenThrow(tCacheException);
            // act
            final result = await repository.getStoraygeUserData(uid: tUid);
            // assert
            verifyZeroInteractions(mockAuthRemoteDataSource);
            verify(() => mockAuthLocalDataSource.getCachedStoraygeUser());
            expect(result, equals(Left(tCacheFailure)));
          },
        );
      });
    });

    group('loginWithEmailAndPassword() ->', () {
      group('[online]', () {
        setUp(() {
          when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        });
        test(
          'should check if device is online',
          () async {
            // arrange
            when(() => mockNetworkInfo.isConnected)
                .thenAnswer((_) async => true);
            when(() => mockAuthRemoteDataSource.loginWithEmailAndPassword(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                )).thenAnswer((_) async => tStoraygeUserModel);
            // act
            repository.loginWithEmailAndPassword(
                email: tEmail, password: tPassword);
            // assert
            verify(() => mockNetworkInfo.isConnected);
          },
        );

        test(
          'should return StoraygeUser with current user details when succesful login',
          () async {
            // arrange
            when(() => mockAuthRemoteDataSource.loginWithEmailAndPassword(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
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
            when(() => mockAuthRemoteDataSource.loginWithEmailAndPassword(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                )).thenAnswer((_) async => tStoraygeUserModel);
            // act
            await repository.loginWithEmailAndPassword(
                email: tEmail, password: tPassword);
            // assert
            verify(() =>
                mockAuthLocalDataSource.storeStoraygeUser(tStoraygeUserModel));
          },
        );

        test(
          'should return FirebaseAuthFailure when login fails',
          () async {
            // arrange
            when(() => mockAuthRemoteDataSource.loginWithEmailAndPassword(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                )).thenThrow(tFirebaseAuthException);
            // act
            final result = await repository.loginWithEmailAndPassword(
                email: tEmail, password: tPassword);
            // assert
            expect(result, equals(Left(tFirebaseAuthFailure)));
          },
        );
      });

      group('[offline]', () {
        setUp(() {
          when(() => mockNetworkInfo.isConnected)
              .thenAnswer((_) async => false);
        });

        test(
          'should return ServerFailure when there is no internet connection',
          () async {
            // act
            final result = await repository.loginWithEmailAndPassword(
                email: tEmail, password: tPassword);
            // assert
            expect(result, equals(Left(tServerFailure)));
          },
        );
      });
    });

    group('registerWithEmailAndPassword() ->', () {
      group('[online]', () {
        setUp(() {
          when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        });

        test(
          'should check if device is online',
          () async {
            // arrange
            when(() => mockNetworkInfo.isConnected)
                .thenAnswer((_) async => true);
            when(() => mockAuthRemoteDataSource.registerWithEmailAndPassword(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                  username: any(named: 'username'),
                )).thenAnswer((_) async => tStoraygeUserModel);
            // act
            repository.registerWithEmailAndPassword(
              email: tEmail,
              password: tPassword,
              username: tUsername,
            );
            // assert
            verify(() => mockNetworkInfo.isConnected);
          },
        );

        test(
          'should return StoraygeUser with current user details when succesful register',
          () async {
            // arrange
            when(() => mockAuthRemoteDataSource.registerWithEmailAndPassword(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                  username: any(named: 'username'),
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
            when(() => mockAuthRemoteDataSource.registerWithEmailAndPassword(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                  username: any(named: 'username'),
                )).thenAnswer((_) async => tStoraygeUserModel);
            // act
            await repository.registerWithEmailAndPassword(
              email: tEmail,
              password: tPassword,
              username: tUsername,
            );
            // assert
            verify(() =>
                mockAuthLocalDataSource.storeStoraygeUser(tStoraygeUserModel));
          },
        );

        test(
          'should return FirebaseAuthFailure when registration fails',
          () async {
            // arrange
            when(() => mockAuthRemoteDataSource.registerWithEmailAndPassword(
                  email: any(named: 'email'),
                  password: any(named: 'password'),
                  username: any(named: 'username'),
                )).thenThrow(tFirebaseAuthException);
            // act
            final result = await repository.registerWithEmailAndPassword(
              email: tEmail,
              password: tPassword,
              username: tUsername,
            );
            // assert
            expect(result, equals(Left(tFirebaseAuthFailure)));
          },
        );
      });

      group('[offline]', () {
        setUp(() {
          when(() => mockNetworkInfo.isConnected)
              .thenAnswer((_) async => false);
        });

        test(
          'should return NoConnectionFailure when there is no internet connection',
          () async {
            // act
            final result = await repository.registerWithEmailAndPassword(
              email: tEmail,
              password: tPassword,
              username: tUsername,
            );
            // assert
            expect(result, equals(Left(tNoConnectionFailure)));
          },
        );
      });
    });

    group('getUid() ->', () {
      test(
        'should return proper uid when user is logged in',
        () async {
          // arrange
          when(() => mockAuthRemoteDataSource.getUid())
              .thenAnswer((_) async => tUid);
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
          when(() => mockAuthRemoteDataSource.getUid())
              .thenThrow(tUserNotFoundException);
          // act
          final result = await repository.getUid();
          // assert
          expect(result, equals(Left(tUserFailure)));
        },
      );
    });

    group('signOut() ->', () {
      test(
        'should return unit when user is succesfully signed out',
        () async {
          // arrange
          when(() => mockAuthRemoteDataSource.signOut())
              .thenAnswer((_) async => unit);
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
          when(() => mockAuthRemoteDataSource.signOut())
              .thenThrow(tFirebaseAuthException);
          // act
          final result = await repository.signOut();
          // assert
          expect(result, equals(Left(tFirebaseAuthFailure)));
        },
      );
    });
  });
}
