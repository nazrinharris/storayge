import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:storayge/core/auth/data/models/storayge_user_model.dart';
import 'package:storayge/core/auth/domain/entities/storayge_user.dart';

import '../../../../presets/entities_presets.dart';
import '../../../fixtures/fixture_reader.dart';

void main() {
  group('StoraygeUserModel', () {
    test(
      'should be a subclass of StoraygeUser entity',
      () async {
        // assert
        expect(tStoraygeUserModel, isA<StoraygeUser>());
      },
    );

    group('fromJson', () {
      test(
        'should return a valid model',
        () async {
          // arrange
          final Map<String, dynamic> jsonMap =
              json.decode(fixture('storayge_user.json'));
          // act
          final result = StoraygeUserModel.fromJson(jsonMap);
          // assert
          expect(result, equals(tStoraygeUserModel));
        },
      );
    });

    group('toJson', () {
      test(
        'should return a JSON map containing the proper data',
        () async {
          // act
          final result = tStoraygeUserModel.toJson();
          // assert
          final expectedMap = {
            "username": "test_username",
            "uid": "test_uid",
            "email": "test@test.com",
          };
          expect(result, equals(expectedMap));
        },
      );
    });
  });
}
