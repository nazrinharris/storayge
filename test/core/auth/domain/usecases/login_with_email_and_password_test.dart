import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storayge/core/auth/domain/usecases/login_with_email_and_password.dart';
import 'package:storayge/core/usecases/params.dart';
import '../../../mock_classes/mock_app_auth/mock_app_auth.mocks.dart';
import '../../../presets/entities_presets.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late LoginWithEmailAndPassword usecase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = LoginWithEmailAndPassword(repository: mockAuthRepository);
  });

  test(
    'should return StoraygeUser after succesfull login',
    () async {
      // arrange
      when(mockAuthRepository.loginWithEmailAndPassword(
        email: anyNamed('email'),
        password: anyNamed('password'),
      )).thenAnswer((_) async => Right(tStoraygeUser));
      // act
      final result = await usecase(LoginParams(
        email: tEmail,
        password: tPassword,
      ));
      // assert
      expect(result, equals(Right(tStoraygeUser)));
      verify(mockAuthRepository.loginWithEmailAndPassword(
        email: tEmail,
        password: tPassword,
      ));
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );
}
