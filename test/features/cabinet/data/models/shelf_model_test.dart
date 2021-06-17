import 'dart:convert';

import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storayge/features/cabinet/data/models/shelf_model.dart';
import 'package:storayge/features/cabinet/domain/entities/shelf.dart';

import '../../../../core/fixtures/fixture_reader.dart';
import '../../../../presets/entities_presets.dart';

void main() {
  test(
    'should be a subclass of Shelf entity',
    () async {
      // assert
      expect(tShelfModel, isA<Shelf>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(fixture('shelf.json'));
        // act
        final result = ShelfModel.fromJson(jsonMap);
        // assert
        expect(result, tShelfModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tShelfModel.toJson();
        // assert
        final expectedMap = {
          "shelfName": "test_shelf_name",
          "shelfId": "test_shelf_id",
          "shelfDesc": "test_shelf_desc",
          "imgPath": "test_img_path",
          "pathName": "test_path_name",
          "containerAmount": 0,
          "itemAmount": 0
        };
        expect(result, expectedMap);
      },
    );
  });
}
