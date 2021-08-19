import 'package:flutter_test/flutter_test.dart';
import 'package:storayge/features/cabinet/domain/entities/storayge_group.dart';
import 'dart:convert';

import '../../../../core/fixtures/fixture_reader.dart';
import '../../../../presets/entities_presets.dart';

void main() {
  test(
    'should return a valid StoraygeGroup class from a valid json',
    () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('storayge_group.json'));
      // act
      final result = StoraygeGroupData.fromJson(jsonMap);
      // assert
      expect(result, tStoraygeGroup);
    },
  );
}
