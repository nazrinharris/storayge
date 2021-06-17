// ignore_for_file: prefer_const_constructors

import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storayge/core/auth/domain/usecases/get_uid.dart';
import 'package:storayge/core/usecases/usecase.dart';

import '../../../../presets/entities_presets.dart';
import '../../../mock_classes/mock_app_auth/mock_app_auth.mocks.dart';

void main() {
  late GetUid usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = GetUid(repository: mockAuthRepository);
  });

  test(
    'should return proper String uid from repository',
    () async {
      // arrange
      when(mockAuthRepository.getUid()).thenAnswer((_) async => Right(tUid));
      // act
      final result = await usecase(NoParams());
      // assert
      expect(result, equals(Right(tUid)));
      verify(mockAuthRepository.getUid());
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );
}
