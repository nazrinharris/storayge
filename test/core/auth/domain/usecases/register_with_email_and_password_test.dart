// ignore_for_file: prefer_const_constructors

import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storayge/core/auth/domain/usecases/register_with_email_and_password.dart';
import 'package:storayge/core/usecases/params.dart';

import '../../../../presets/entities_presets.dart';
import '../../../mock_classes/mock_app_auth/mock_app_auth.mocks.dart';

void main() {
  late RegisterWithEmailAndPassword usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();

    usecase = RegisterWithEmailAndPassword(repository: mockAuthRepository);
  });

  test(
    'should return StoraygeUser after succesfull registration',
    () async {
      // arrange
      when(mockAuthRepository.registerWithEmailAndPassword(
              email: tEmail, password: tPassword, username: tUsername))
          .thenAnswer((_) async => Right(tStoraygeUser));
      // act
      final result = await usecase(const RegisterParams(
        email: tEmail,
        password: tPassword,
        username: tUsername,
      ));
      // assert
      expect(result, equals(Right(tStoraygeUser)));
      verify(mockAuthRepository.registerWithEmailAndPassword(
          email: tEmail, password: tPassword, username: tUsername));
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );
}
