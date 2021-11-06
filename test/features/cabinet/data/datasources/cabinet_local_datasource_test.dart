import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:storayge/features/cabinet/data/datasources/cabinet_local_datasource.dart';
import 'package:storayge/features/cabinet/domain/entities/storayge_group.dart';

import '../../../../core/fixtures/fixture_reader.dart';
import '../../../../presets/entities_presets.dart';

class MockHiveInterface extends Mock implements HiveInterface {}

class MockBox extends Mock implements Box {}

class FakeStoraygeGroupAllListSnippet extends Fake
    implements List<StoraygeGroupSnippet> {}

class FakeStoraygeGroupSnippet extends Fake implements StoraygeGroupSnippet {}

void main() {
  late MockHiveInterface mockHiveInterface;
  late MockBox mockBox;
  late CabinetLocalDataSource cabinetLocalDataSource;

  setUp(() {
    mockHiveInterface = MockHiveInterface();
    mockBox = MockBox();

    cabinetLocalDataSource = CabinetLocalDataSource(
      hiveInterface: mockHiveInterface,
    );

    registerFallbackValue(FakeStoraygeGroupAllListSnippet());
  });

  group('CabinetLocalDatasource', () {
    group('storeAllListSGSnip() ->', () {
      test(
        'should return unit when storing is succesfull',
        () async {
          // arrange
          when(() => mockHiveInterface.openBox(any()))
              .thenAnswer((_) async => mockBox);
          when(() => mockBox.put(any(), any()))
              .thenAnswer((_) => Future.value());
          // act
          final result = await cabinetLocalDataSource
              .storeAllListSGSnip(tStoraygeGroupAllListSnipOne);
          // assert
          expect(result, unit);
        },
      );
      test(
        'should store sgSnippet into Hive with the correct arguments and amount (two snippets)',
        () async {
          // arrange
          when(() => mockHiveInterface.openBox(any()))
              .thenAnswer((_) async => mockBox);
          when(() => mockBox.put(any(), any()))
              .thenAnswer((_) => Future.value());
          // act
          await cabinetLocalDataSource
              .storeAllListSGSnip(tStoraygeGroupAllListSnipTwo);
          // assert
          verifyInOrder([
            () => mockBox.put(tsgIdSnip, tStoraygeGroupSnippet.toJson()),
            () => mockBox.put(tsgIdSnip2, tStoraygeGroupSnippet2.toJson()),
          ]);
        },
      );
    });

    group('getAllListSGSnipFromLocal() ->', () {
      test(
        'should retrieve snippet from box three times, when there is two snippets in local',
        () async {
          // arrange
          when(() => mockHiveInterface.openBox(any()))
              .thenAnswer((_) async => mockBox);
          when(() => mockBox.get(0)).thenAnswer(
              (_) => json.decode(fixture('storayge_group_snippet.json')));
          when(() => mockBox.get(1)).thenAnswer(
              (_) => json.decode(fixture('storayge_group_snippet_2.json')));
          when(() => mockBox.get(2)).thenAnswer((_) => null);
          // act
          await cabinetLocalDataSource.getAllListSGSnipFromLocal();
          // assert
          verifyInOrder([
            () => mockBox.get(0),
            () => mockBox.get(1),
            () => mockBox.get(2),
          ]);
        },
      );

      test(
        'should return List<StoraygeGroupSnippet> when call to local is successfull (2 snippets)',
        () async {
          // arrange
          when(() => mockHiveInterface.openBox(any()))
              .thenAnswer((_) async => mockBox);
          when(() => mockBox.get(0)).thenAnswer(
              (_) => json.decode(fixture('storayge_group_snippet.json')));
          when(() => mockBox.get(1)).thenAnswer(
              (_) => json.decode(fixture('storayge_group_snippet_two.json')));
          when(() => mockBox.get(2)).thenAnswer((_) => null);
          // act
          final result =
              await cabinetLocalDataSource.getAllListSGSnipFromLocal();
          // assert
          expect(result, tStoraygeGroupAllListSnipTwo);
        },
      );
    });
  });
}
