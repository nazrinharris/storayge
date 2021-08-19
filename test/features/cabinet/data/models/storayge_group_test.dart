import 'dart:convert';

import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storayge/features/cabinet/domain/entities/item.dart';
import 'package:storayge/features/cabinet/domain/entities/storayge_group.dart';

import '../../../../core/fixtures/fixture_reader.dart';
import '../../../../presets/entities_presets.dart';

void main() {
  group('fromJson', () {
    test(
      'should return a valid model',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('storayge_group.json'));
        // act
        final result = StoryageGroup.fromJson(jsonMap);
        // assert
        expect(result, tStoraygeGroup);
      },
    );
  });

  // group('toJson', () {
  //   test(
  //     'should return a JSON map containing the proper data',
  //     () async {
  //       // act
  //       final result = tStoraygeGroupModel.toJson();
  //       // assert
  //       final expectedMap = {
  //         "storaygeGroupName": "test_storayge_group_name",
  //         "storaygeGroupId": "test_storayge_group_id",
  //         "storaygeGroupDesc": "test_storayge_group_desc",
  //         "imgPath": "test_img_path",
  //         "pathName": "test_path_name",
  //         "storaygeGroupAmount": 0,
  //         "itemAmount": 0,
  //         "storaygeGroupList": [{}],
  //         "itemList": [{}],
  //         "storaygeGroupImages": [],
  //         "storaygeGroupPathName": "test_storayge_group_path_name",
  //       };
  //       expect(result, expectedMap);
  //     },
  //   );
  // });
}

/// Presets
StoryageGroup _tStoraygeGroup = StoryageGroup(
  storaygeGroupName: _tStoraygeGroupName,
  storaygeGroupId: _tStoraygeGroupId,
  storaygeGroupDesc: _tStoraygeGroupDesc,
  storaygeGroupAmount: _tStoraygeGroupAmount,
  itemAmount: _tItemAmount,
  storaygeGroupList: _tStoraygeGroupList,
  itemList: _tItemList,
  storaygeGroupImages: _tStoraygeGroupImages,
  storaygeGroupPathName: _tStoraygeGroupPathName,
);

const String _tStoraygeGroupName = 'test_storayge_group_name';
const String _tStoraygeGroupId = 'test_storayge_group_id';
const String _tStoraygeGroupDesc = 'test_storayge_group_desc';
const String _tImgPath = 'test_img_path';
const String _tPathName = 'test_path_name';
const int _tStoraygeGroupAmount = 0;
const int _tItemAmount = 0;
List<StoryageGroup> _tStoraygeGroupList = [];
List<Item> _tItemList = [];
List<String?>? _tStoraygeGroupImages = [];
String? _tStoraygeGroupPathName = 'test_storayge_group_path_name';
