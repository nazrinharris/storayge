import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:storayge/core/auth/data/datasources/auth_local_data_source.dart';
import 'package:storayge/core/constants/app_const.dart';
import 'package:storayge/core/errors/exceptions.dart';

import '../../../../presets/entities_presets.dart';
import '../../../mock_classes/mock_hive/mock_hive.mocks.dart';

void main() {
  late AuthLocalDataSourceImpl dataSourceImpl;
  late MockHiveInterface mockHiveInterface;
  late MockBox mockBox;

  setUp(() {
    mockHiveInterface = MockHiveInterface();
    mockBox = MockBox();
    dataSourceImpl = AuthLocalDataSourceImpl(
      hiveInterface: mockHiveInterface,
    );
  });

  group('getCachedStoraygeUser', () {
    test(
      'should return StoraygeUser from StoraygeUserBox when there is one in the cache',
      () async {
        // arrange
        when(mockHiveInterface.openBox(any)).thenAnswer((_) async => mockBox);
        when(mockBox.get(any)).thenAnswer((_) async => tStoraygeUserModel);
        // act
        final result = await dataSourceImpl.getCachedStoraygeUser();
        // assert
        verify(mockHiveInterface.openBox(any));
        verify(mockBox.get(any));
        expect(result, equals(tStoraygeUserModel));
      },
    );

    test(
      'should throw CacheException when there is no StoraygeUserModel in cache',
      () async {
        // arrange
        when(mockHiveInterface.openBox(any)).thenAnswer((_) async => mockBox);
        when(mockBox.get(any)).thenAnswer((_) async => null);
        // act
        final call = dataSourceImpl.getCachedStoraygeUser;
        // assert
        expect(() => call(), throwsA(isA<CacheException>()));
      },
    );
  });

  group('cacheStoraygeUser', () {
    test(
      'should call HiveInterface and Box to cache data',
      () async {
        when(mockHiveInterface.openBox(any)).thenAnswer((_) async => mockBox);
        when(mockBox.put(any, any)).thenAnswer((_) async => Future.value());
        // act
        await dataSourceImpl.cacheStoraygeUser(tStoraygeUserModel);
        // assert
        verify(mockHiveInterface.openBox(HIVE_BOX_STORAYGE_USER));
        verify(mockBox.put(HIVE_KEY_STORAYGE_USER, tStoraygeUserModel));
      },
    );
  });
}
