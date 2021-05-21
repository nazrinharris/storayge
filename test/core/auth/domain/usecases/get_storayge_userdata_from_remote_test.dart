import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:storayge/core/auth/domain/entities/storayge_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storayge/core/auth/domain/usecases/get_storayge_userdata_from_remote.dart';
import 'package:storayge/core/usecases/params.dart';
import '../../../mock_classes/mock_app_auth/mock_app_auth.mocks.dart';

void main() {
  late GetStoraygeUserDataFromRemote usecase;
  late MockAuthRepository mockAuthRepository;

  late String tUid;
  late StoraygeUser tStoraygeUser;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = GetStoraygeUserDataFromRemote(repository: mockAuthRepository);
    tStoraygeUser = StoraygeUser(
      username: 'test_username',
      email: 'test@test.com',
      uid: 'test_uid',
    );
    tUid = 'test_uid';
  });

  test(
    'should get StoraygeUser data from the repository',
    () async {
      // arrange
      when(mockAuthRepository.getStoraygeUserDataFromRemote(
              uid: anyNamed('uid')))
          .thenAnswer((_) async => Right(tStoraygeUser));
      // act
      final result = await usecase(UidParams(uid: tUid));
      // assert
      expect(result, equals(Right(tStoraygeUser)));
      verify(mockAuthRepository.getStoraygeUserDataFromRemote(uid: tUid));
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );
}
