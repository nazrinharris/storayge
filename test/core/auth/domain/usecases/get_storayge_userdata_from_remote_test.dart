import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storayge/core/auth/domain/usecases/get_storayge_userdata_from_remote.dart';
import 'package:storayge/core/usecases/params.dart';
import '../../../../presets/entities_presets.dart';
import '../../../mock_classes/mock_app_auth/mock_app_auth.mocks.dart';

void main() {
  late GetStoraygeUserDataFromRemote usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = GetStoraygeUserDataFromRemote(repository: mockAuthRepository);
  });

  test(
    'should get StoraygeUser data from the repository',
    () async {
      // arrange
      when(mockAuthRepository.getStoraygeUserDataFromRemote(
              uid: anyNamed('uid')))
          .thenAnswer((_) async => Right(tStoraygeUser));
      // act
      final result = await usecase(const UidParams(uid: tUid));
      // assert
      expect(result, equals(Right(tStoraygeUser)));
      verify(mockAuthRepository.getStoraygeUserDataFromRemote(uid: tUid));
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );
}
