// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart' as bloc;
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storayge/core/auth/auth_cubit/auth_cubit.dart';
import 'package:storayge/core/usecases/params.dart';

import '../../mock_classes/mock_app_auth/mock_app_auth.mocks.dart';
import '../../presets/entities_presets.dart';
import '../../presets/failures_exceptions_presets.dart';

void main() {
  late AuthCubit cubit;
  late MockGetStoraygeUserDataFromRemote mockGetStoraygeUserDataFromRemote;

  setUp(() {
    mockGetStoraygeUserDataFromRemote = MockGetStoraygeUserDataFromRemote();

    cubit = AuthCubit(
      getStoraygeUserDataFromRemote: mockGetStoraygeUserDataFromRemote,
    );
  });

  group('AuthCubit', () {
    bloc.blocTest(
      'emits [] upon creation',
      build: () => AuthCubit(
          getStoraygeUserDataFromRemote: mockGetStoraygeUserDataFromRemote),
      expect: () => [],
    );

    group('GetStoraygeUserDataFromRemote', () {
      test(
        'should retrieve data from the GetStoraygeUserDataFromRemote usecase',
        () async {
          // arrange
          when(mockGetStoraygeUserDataFromRemote(any))
              .thenAnswer((_) async => Right(tStoraygeUser));
          // act
          cubit.getStoraygeUserData(uid: tUid);
          await untilCalled(mockGetStoraygeUserDataFromRemote(any));
          // assert
          verify(mockGetStoraygeUserDataFromRemote(UidParams(uid: tUid)));
        },
      );

      bloc.blocTest(
          'should emit [AuthLoading, AuthGetStoraygeUserCompleted] when succesfull',
          build: () => AuthCubit(
              getStoraygeUserDataFromRemote: mockGetStoraygeUserDataFromRemote),
          act: (AuthCubit cubit) {
            when(mockGetStoraygeUserDataFromRemote(any))
                .thenAnswer((_) async => Right(tStoraygeUser));
            cubit.getStoraygeUserData(uid: tUid);
          },
          expect: () => [
                // AuthIdle(), //TODO : Should find out why initial state of cubit is not emitted in this scenario
                AuthLoading(),
                AuthGetStoraygeUserCompleted(storaygeUser: tStoraygeUser)
              ]);

      bloc.blocTest('should emit [AuthLoading, AuthError] when fail',
          build: () => AuthCubit(
              getStoraygeUserDataFromRemote: mockGetStoraygeUserDataFromRemote),
          act: (AuthCubit cubit) {
            when(mockGetStoraygeUserDataFromRemote(any))
                .thenAnswer((_) async => Left(testFirestoreFailure));
            cubit.getStoraygeUserData(uid: tUid);
          },
          expect: () => [
                AuthLoading(),
                AuthError(message: 'test_message', code: 'TEST'),
              ]);

      bloc.blocTest(
          'should emit [AuthLoading, AuthError] with proper error message',
          build: () => AuthCubit(
              getStoraygeUserDataFromRemote: mockGetStoraygeUserDataFromRemote),
          act: (AuthCubit cubit) {
            when(mockGetStoraygeUserDataFromRemote(any))
                .thenAnswer((_) async => Left(testFirestoreFailure));
            cubit.getStoraygeUserData(uid: tUid);
          },
          expect: () => [
                AuthLoading(),
                AuthError(message: 'test_message', code: 'TEST'),
              ]);
    });
  });
}
