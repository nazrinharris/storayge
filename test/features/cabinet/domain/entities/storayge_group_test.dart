// ignore_for_file: prefer_const_constructors

import 'dart:convert' as json;
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:storayge/features/cabinet/domain/entities/storayge_group.dart';

const String tsgNameSnip = 'test_storayge_group_name_snip';
const String tsgIdSnip = 'test_storayge_group_id_snip';
const String tsgDescSnip = 'test_storayge_group_desc_snip';
const String tsgImgPathSnip = 'test_storayge_group_img_path_snip';

const String tsgNameSnip2 = '2_test_storayge_group_name_snip';
const String tsgIdSnip2 = '2_test_storayge_group_id_snip';
const String tsgDescSnip2 = '2_test_storayge_group_desc_snip';
const String tsgImgPathSnip2 = '2_test_storayge_group_img_path_snip';

String fixture(String name) =>
    File('test/core/fixtures/$name').readAsStringSync();
void main() {
  late StoraygeGroup tStoraygeGroupAllListSnipOne;
  late StoraygeGroup tStoraygeGroupAllListSnipTwo;

  late StoraygeGroupSnippet tStoraygeGroupSnippet;
  late StoraygeGroupSnippet tStoraygeGroupSnippet2;

  setUp(() {
    tStoraygeGroupSnippet = StoraygeGroupSnippet(
      sgId: tsgIdSnip,
      sgName: tsgNameSnip,
      sgDesc: tsgDescSnip,
      sgImgPath: tsgImgPathSnip,
    );

    tStoraygeGroupSnippet2 = StoraygeGroupSnippet(
      sgId: tsgIdSnip2,
      sgName: tsgNameSnip2,
      sgDesc: tsgDescSnip2,
      sgImgPath: tsgImgPathSnip2,
    );

    tStoraygeGroupAllListSnipOne = StoraygeGroup.storaygeGroupAllList(
      sgAllList: [tStoraygeGroupSnippet],
    );

    tStoraygeGroupAllListSnipTwo = StoraygeGroup.storaygeGroupAllList(
      sgAllList: [tStoraygeGroupSnippet, tStoraygeGroupSnippet2],
    );
  });

  test(
    'should verify StoraygeGroupSnippet is not a subtype of StoraygeGroup',
    () async {
      // assert
      expect(tStoraygeGroupSnippet, isNot(StoraygeGroup));
    },
  );

  test(
    'should return a valid StoraygeGroupAllList class when there is only one SG in sgAllList json',
    () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.json.decode(fixture('storayge_group_snippet_list_one.json'));
      // act
      final result = StoraygeGroupAllList.fromJson(jsonMap);
      // assert
      expect(result, tStoraygeGroupAllListSnipOne);
    },
  );

  test(
    'should return a valid StoraygeGroupAllList class when there is two SG in sgAllList json',
    () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.json.decode(fixture('storayge_group_snippet_list_two.json'));
      // act
      final result = StoraygeGroupAllList.fromJson(jsonMap);
      // assert
      expect(result, tStoraygeGroupAllListSnipTwo);
    },
  );
}
