// ignore_for_file: prefer_const_constructors

import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storayge/core/usecases/params.dart';
import 'package:storayge/features/cabinet/domain/usecases/get_shelf.dart';

import '../../../../presets/entities_presets.dart';
import '../../mock_classes/mock_app_cabinet/mock_app_cabinet.mocks.dart';

void main() {
  late MockCabinetRepository mockCabinetRepository;
  late GetShelf usecase;

  setUp(() {
    mockCabinetRepository = MockCabinetRepository();
    usecase = GetShelf(repository: mockCabinetRepository);
  });

  test(
    'should return Shelf when request to repository is succesfull',
    () async {
      // arrange
      when(mockCabinetRepository.getShelf(
        uid: anyNamed('uid'),
        shelfId: anyNamed('shelfId'),
      )).thenAnswer((_) async => Right(tShelf));
      // act
      final result = await usecase(ShelfParams(uid: tUid, shelfId: tShelfId));
      // assert
      expect(result, Right(tShelf));
      verify(mockCabinetRepository.getShelf(uid: tUid, shelfId: tShelfId));
    },
  );
}
