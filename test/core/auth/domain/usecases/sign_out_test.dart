// ignore_for_file: prefer_const_constructors

import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storayge/core/auth/domain/usecases/sign_out.dart';
import 'package:storayge/core/usecases/usecase.dart';

import '../../../mock_classes/mock_app_auth/mock_app_auth.mocks.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late SignOut usecase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = SignOut(mockAuthRepository);
  });

  test(
    'should return unit after succesfull sign out',
    () async {
      // arrange
      when(mockAuthRepository.signOut()).thenAnswer((_) async => Right(unit));
      // act
      final result = await usecase(NoParams());
      // assert
      expect(result, equals(Right(unit)));
    },
  );
}
