// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart' as bloc;
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storayge/core/auth/auth_cubit/auth_cubit.dart';
import 'package:storayge/core/usecases/params.dart';

import '../../../presets/entities_presets.dart';
import '../../../presets/failures_exceptions_presets.dart';
import '../../mock_classes/mock_app_auth/mock_app_auth.mocks.dart';

void main() {
  late AuthCubit cubit;
  late MockGetStoraygeUserDataFromRemote mockGetStoraygeUserDataFromRemote;
  late MockLoginWithEmailAndPassword mockLoginWithEmailAndPassword;
  late MockRegisterWithEmailAndPassword mockRegisterWithEmailAndPassword;
  late MockAuthRepositoryImpl mockAuthRepositoryImpl;

  setUp(() {
    mockGetStoraygeUserDataFromRemote = MockGetStoraygeUserDataFromRemote();
    mockLoginWithEmailAndPassword = MockLoginWithEmailAndPassword();
    mockRegisterWithEmailAndPassword = MockRegisterWithEmailAndPassword();
    mockAuthRepositoryImpl = MockAuthRepositoryImpl();

    cubit = AuthCubit(
      getStoraygeUserDataFromRemote: mockGetStoraygeUserDataFromRemote,
      loginWithEmailAndPassword: mockLoginWithEmailAndPassword,
      registerWithEmailAndPassword: mockRegisterWithEmailAndPassword,
      authRepository: mockAuthRepositoryImpl,
    );
  });

  group('AuthCubit', () {
    bloc.blocTest(
      'emits [] upon creation',
      build: () => AuthCubit(
        getStoraygeUserDataFromRemote: mockGetStoraygeUserDataFromRemote,
        loginWithEmailAndPassword: mockLoginWithEmailAndPassword,
        registerWithEmailAndPassword: mockRegisterWithEmailAndPassword,
        authRepository: mockAuthRepositoryImpl,
      ),
      expect: () => [],
    );

    group('getStoraygeUserDataRun', () {
      test(
        'should retrieve data from the GetStoraygeUserDataFromRemote usecase',
        () async {
          // arrange
          when(mockGetStoraygeUserDataFromRemote(any))
              .thenAnswer((_) async => Right(tStoraygeUser));
          // act
          cubit.getStoraygeUserDataRun(uid: tUid);
          await untilCalled(mockGetStoraygeUserDataFromRemote(any));
          // assert
          verify(mockGetStoraygeUserDataFromRemote(UidParams(uid: tUid)));
        },
      );

      bloc.blocTest(
          'should emit [AuthLoading, AuthGetStoraygeUserCompleted] when succesfull',
          build: () => AuthCubit(
                getStoraygeUserDataFromRemote:
                    mockGetStoraygeUserDataFromRemote,
                loginWithEmailAndPassword: mockLoginWithEmailAndPassword,
                registerWithEmailAndPassword: mockRegisterWithEmailAndPassword,
                authRepository: mockAuthRepositoryImpl,
              ),
          act: (AuthCubit cubit) {
            when(mockGetStoraygeUserDataFromRemote(any))
                .thenAnswer((_) async => Right(tStoraygeUser));
            cubit.getStoraygeUserDataRun(uid: tUid);
          },
          expect: () => [
                // AuthIdle(), //TODO : Should find out why initial state of cubit is not emitted in this scenario
                AuthLoading(currentOperationMessage: 'message'),
                AuthLoaded(storaygeUser: tStoraygeUser)
              ]);

      bloc.blocTest(
          'should emit [AuthLoading, AuthError] when fail with proper error code',
          build: () => AuthCubit(
                getStoraygeUserDataFromRemote:
                    mockGetStoraygeUserDataFromRemote,
                loginWithEmailAndPassword: mockLoginWithEmailAndPassword,
                registerWithEmailAndPassword: mockRegisterWithEmailAndPassword,
                authRepository: mockAuthRepositoryImpl,
              ),
          act: (AuthCubit cubit) {
            when(mockGetStoraygeUserDataFromRemote(any))
                .thenAnswer((_) async => Left(testFirestoreFailure));
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
          when(mockLoginWithEmailAndPassword(any))
              .thenAnswer((_) async => Right(tStoraygeUser));
          // act
          cubit.loginWithEmailAndPasswordRun(
            email: tEmail,
            password: tPassword,
          );
          await untilCalled(mockLoginWithEmailAndPassword(any));
          // assert
          verify(mockLoginWithEmailAndPassword(LoginParams(
            email: tEmail,
            password: tPassword,
          )));
        },
      );
      bloc.blocTest(
        'should emit [AuthLoading, AuthLoaded] when succesfull',
        build: () => AuthCubit(
          getStoraygeUserDataFromRemote: mockGetStoraygeUserDataFromRemote,
          loginWithEmailAndPassword: mockLoginWithEmailAndPassword,
          registerWithEmailAndPassword: mockRegisterWithEmailAndPassword,
          authRepository: mockAuthRepositoryImpl,
        ),
        act: (AuthCubit cubit) {
          when(mockLoginWithEmailAndPassword(any))
              .thenAnswer((_) async => Right(tStoraygeUser));
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
          getStoraygeUserDataFromRemote: mockGetStoraygeUserDataFromRemote,
          loginWithEmailAndPassword: mockLoginWithEmailAndPassword,
          registerWithEmailAndPassword: mockRegisterWithEmailAndPassword,
          authRepository: mockAuthRepositoryImpl,
        ),
        act: (AuthCubit cubit) {
          when(mockLoginWithEmailAndPassword(any))
              .thenAnswer((_) async => Left(testFirebaseAuthFailure));
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
