// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart' as bloc;
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storayge/core/auth/auth_cubit/auth_cubit.dart';
import 'package:storayge/core/auth/data/repository/auth_repository.dart';

import '../../../presets/entities_presets.dart';
import '../../../presets/failures_exceptions_presets.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late AuthCubit cubit;

  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();

    cubit = AuthCubit(
      authRepository: mockAuthRepository,
    );
  });

  group('AuthCubit', () {
    bloc.blocTest(
      'emits [] upon creation',
      build: () => AuthCubit(
        authRepository: mockAuthRepository,
      ),
      expect: () => [],
    );

    group('getStoraygeUserDataRun', () {
      test(
        'should retrieve data from the GetStoraygeUserDataFromRemote usecase',
        () async {
          // arrange
          when(() => mockAuthRepository.getStoraygeUserDataFromRemote(
                uid: any(named: "uid"),
              )).thenAnswer((_) async => Right(tStoraygeUser));
          // act
          cubit.getStoraygeUserDataRun(uid: tUid);
          await untilCalled(() => mockAuthRepository
              .getStoraygeUserDataFromRemote(uid: any(named: "uid")));
          // assert
          verify(() =>
              mockAuthRepository.getStoraygeUserDataFromRemote(uid: tUid));
        },
      );

      bloc.blocTest(
          'should emit [AuthLoading, AuthGetStoraygeUserCompleted] when succesfull',
          build: () => AuthCubit(
                authRepository: mockAuthRepository,
              ),
          act: (AuthCubit cubit) {
            when(() => mockAuthRepository.getStoraygeUserDataFromRemote(
                  uid: any(named: "uid"),
                )).thenAnswer((_) async => Right(tStoraygeUser));
            cubit.getStoraygeUserDataRun(uid: tUid);
          },
          expect: () => [
                AuthLoading(currentOperationMessage: 'message'),
                AuthLoaded(storaygeUser: tStoraygeUser)
              ]);

      bloc.blocTest(
          'should emit [AuthLoading, AuthError] when fail with proper error code',
          build: () => AuthCubit(
                authRepository: mockAuthRepository,
              ),
          act: (AuthCubit cubit) {
            when(() => mockAuthRepository.getStoraygeUserDataFromRemote(
                  uid: any(named: 'uid'),
                )).thenAnswer((_) async => Left(tFirestoreFailure));
            cubit.getStoraygeUserDataRun(uid: tUid);
          },
          expect: () => [
                AuthLoading(currentOperationMessage: 'message'),
                AuthError(message: 'test_message', code: 'TEST'),
              ]);
    });

    group('loginWithEmailAndPasswordRun', () {
      test(
        'should retrieve data from the GetStoraygeUserDataFromRemote usecase',
        () async {
          // arrange
          when(() => mockAuthRepository.loginWithEmailAndPassword(
                  email: any(named: 'email'), password: any(named: 'password')))
              .thenAnswer((_) async => Right(tStoraygeUser));
          // act
          cubit.loginWithEmailAndPasswordRun(
            email: tEmail,
            password: tPassword,
          );
          await untilCalled(() => mockAuthRepository.loginWithEmailAndPassword(
                email: any(named: 'email'),
                password: any(named: 'password'),
              ));
          // assert
          verify(
            () => mockAuthRepository.loginWithEmailAndPassword(
                email: tEmail, password: tPassword),
          );
        },
      );
      bloc.blocTest(
        'should emit [AuthLoading, AuthLoaded] when succesfull',
        build: () => AuthCubit(
          authRepository: mockAuthRepository,
        ),
        act: (AuthCubit cubit) {
          when(() => mockAuthRepository.loginWithEmailAndPassword(
                email: any(named: 'email'),
                password: any(named: 'password'),
              )).thenAnswer((_) async => Right(tStoraygeUser));
          cubit.loginWithEmailAndPasswordRun(
            email: tEmail,
            password: tPassword,
          );
        },
        expect: () => [
          AuthLoading(currentOperationMessage: 'message'),
          AuthLoaded(storaygeUser: tStoraygeUser),
        ],
      );

      bloc.blocTest(
        'should emit [AuthLoading, AuthError] when fail',
        build: () => AuthCubit(
          authRepository: mockAuthRepository,
        ),
        act: (AuthCubit cubit) {
          when(() => mockAuthRepository.loginWithEmailAndPassword(
                email: any(named: 'email'),
                password: any(named: 'password'),
              )).thenAnswer((_) async => Left(tFirebaseAuthFailure));
          cubit.loginWithEmailAndPasswordRun(
            email: tEmail,
            password: tPassword,
          );
        },
        expect: () => [
          AuthLoading(currentOperationMessage: 'message'),
          AuthError(message: 'test_message', code: 'TEST'),
        ],
      );
    });
  });
}
