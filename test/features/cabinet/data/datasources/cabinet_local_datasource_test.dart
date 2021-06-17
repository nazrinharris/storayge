import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storayge/core/constants/app_const.dart';
import 'package:storayge/core/errors/exceptions.dart';
import 'package:storayge/features/cabinet/data/datasources/cabinet_local_datasource.dart';

import '../../../../core/mock_classes/mock_hive/mock_hive.mocks.dart';
import '../../../../presets/entities_presets.dart';

void main() {
  late MockHiveInterface mockHiveInterface;
  late MockBox mockBox;
  late CabinetLocalDataSourceImpl cabinetLocalDataSourceImpl;

  setUp(() {
    mockHiveInterface = MockHiveInterface();
    mockBox = MockBox();

    cabinetLocalDataSourceImpl = CabinetLocalDataSourceImpl(
      hiveInterface: mockHiveInterface,
    );
  });

  group('getShelfFromLocal', () {
    test(
      'should return Shelf from ShelfBox when the requested shelf exists',
      () async {
        // arrange
        when(mockHiveInterface.openBox(any)).thenAnswer((_) async => mockBox);
        when(mockBox.get(any)).thenAnswer((_) async => tShelfModel);
        // act
        final result = await cabinetLocalDataSourceImpl.getShelfFromLocal(
            shelfId: tShelfId);
        // assert
        verify(mockHiveInterface.openBox(HIVE_BOX_SHELF));
        verify(mockBox.get(tShelfId));
        expect(result, equals(tShelfModel));
      },
    );

    test(
      'should throw CacheException when the requested shelf does not exist',
      () async {
        // arrange
        when(mockHiveInterface.openBox(any)).thenAnswer((_) async => mockBox);
        when(mockBox.get(any)).thenAnswer((_) async => null);
        // act
        final call = cabinetLocalDataSourceImpl.getShelfFromLocal;
        // assert
        expect(() => call(shelfId: tShelfId),
            throwsA(predicate((e) => e is CacheException)));
      },
    );
  });

  group('storeShelf', () {
    test(
      'should store ShelfModel in ShelfBox',
      () async {
        // arrange
        when(mockHiveInterface.openBox(any)).thenAnswer((_) async => mockBox);
        when(mockBox.put(any, any)).thenAnswer((_) async => Future.value());
        // act
        final result = await cabinetLocalDataSourceImpl.storeShelfInLocal(
            shelfModel: tShelfModel);
        // assert
        verify(mockHiveInterface.openBox(HIVE_BOX_SHELF));
        verify(mockBox.put(tShelfModel.shelfId, tShelfModel));
        expect(result, unit);
      },
    );
  });

  group('createShelf', () {
    // TODO : Create tests
  });
}
