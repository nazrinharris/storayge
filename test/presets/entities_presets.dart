// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:storayge/core/auth/data/models/storayge_user_model.dart';
import 'package:storayge/core/auth/domain/entities/storayge_user.dart';
import 'package:storayge/features/cabinet/domain/entities/item.dart';
import 'package:storayge/features/cabinet/domain/entities/storayge_group.dart';

import '../core/fixtures/fixture_reader.dart';

//! Auth
// Entities
StoraygeUser tStoraygeUser = const StoraygeUser(
  username: tUsername,
  email: tEmail,
  uid: tUid,
);

// Models and JSON
StoraygeUserModel tStoraygeUserModel = StoraygeUserModel(
  username: tUsername,
  email: tEmail,
  uid: tUid,
);
StoraygeUserModel tStoraygeUserModelFromJSON =
    StoraygeUserModel.fromJson(json.decode(fixture('storayge_user.json')));
Map<String, dynamic> tStoraygeUserJSON =
    json.decode(fixture('storayge_user.json'));

// Concrete Inputs
const String tUid = 'test_uid';
const String tEmail = 'test@test.com';
const String tUsername = 'test_username';
const String tPassword = 'test_password';

//! Cabinet
// Entities
StoryageGroup tStoraygeGroup = StoryageGroup(
  storaygeGroupName: tStoraygeGroupName,
  storaygeGroupId: tStoraygeGroupId,
  storaygeGroupDesc: tStoraygeGroupDesc,
  storaygeGroupAmount: tStoraygeGroupAmount,
  itemAmount: tItemAmount,
  storaygeGroupList: tStoraygeGroupList,
  itemList: tItemList,
  storaygeGroupImages: tStoraygeGroupImages,
  storaygeGroupPathName: tStoraygeGroupPathName,
);

// Models and JSON
Map<String, dynamic> tShelfJSON = json.decode(fixture('storayge_group.json'));

List<StoryageGroup> tListStoraygeGroup = [
  StoryageGroup(
    storaygeGroupName: tStoraygeGroupName,
    storaygeGroupId: tStoraygeGroupId,
    storaygeGroupDesc: tStoraygeGroupDesc,
    storaygeGroupAmount: tStoraygeGroupAmount,
    itemAmount: tItemAmount,
    storaygeGroupList: tStoraygeGroupList,
    itemList: tItemList,
    storaygeGroupImages: tStoraygeGroupImages,
    storaygeGroupPathName: tStoraygeGroupPathName,
  ),
  StoryageGroup(
    storaygeGroupName: tStoraygeGroupName2,
    storaygeGroupId: tStoraygeGroupId2,
    storaygeGroupDesc: tStoraygeGroupDesc2,
    storaygeGroupAmount: tStoraygeGroupAmount2,
    itemAmount: tItemAmount2,
    storaygeGroupList: tStoraygeGroupList2,
    itemList: tItemList2,
    storaygeGroupImages: tStoraygeGroupImages2,
    storaygeGroupPathName: tStoraygeGroupPathName2,
  ),
  StoryageGroup(
    storaygeGroupName: tStoraygeGroupName3,
    storaygeGroupId: tStoraygeGroupId3,
    storaygeGroupDesc: tStoraygeGroupDesc3,
    storaygeGroupAmount: tStoraygeGroupAmount3,
    itemAmount: tItemAmount3,
    storaygeGroupList: tStoraygeGroupList3,
    itemList: tItemList3,
    storaygeGroupImages: tStoraygeGroupImages3,
    storaygeGroupPathName: tStoraygeGroupPathName3,
  ),
];

// Concrete Inputs
const String tStoraygeGroupName = 'test_storayge_group_name';
const String tStoraygeGroupId = 'test_storayge_group_id';
const String tStoraygeGroupDesc = 'test_storayge_group_desc';
const String tImgPath = 'test_img_path';
const String tPathName = 'test_path_name';
const int tStoraygeGroupAmount = 0;
const int tItemAmount = 0;
List<StoryageGroup> tStoraygeGroupList = [];
List<Item> tItemList = [];
List<String?>? tStoraygeGroupImages = [];
String? tStoraygeGroupPathName = 'test_storayge_group_path_name';

const String tStoraygeGroupName2 = 'test_storayge_group_name_2';
const String tStoraygeGroupId2 = 'test_storayge_group_id_2';
const String tStoraygeGroupDesc2 = 'test_storayge_group_desc_2';
const String tImgPath2 = 'test_img_path_2';
const String tPathName2 = 'test_path_name_2';
const int tStoraygeGroupAmount2 = 0;
const int tItemAmount2 = 0;
List<StoryageGroup> tStoraygeGroupList2 = [];
List<Item> tItemList2 = [];
List<String?>? tStoraygeGroupImages2 = [];
String? tStoraygeGroupPathName2 = 'test_storayge_group_path_name_2';

const String tStoraygeGroupName3 = 'test_storayge_group_name_3';
const String tStoraygeGroupId3 = 'test_storayge_group_id_3';
const String tStoraygeGroupDesc3 = 'test_storayge_group_desc_3';
const String tImgPath3 = 'test_img_path_3';
const String tPathName3 = 'test_path_name_3';
const int tStoraygeGroupAmount3 = 0;
const int tItemAmount3 = 0;
List<StoryageGroup> tStoraygeGroupList3 = [];
List<Item> tItemList3 = [];
List<String?>? tStoraygeGroupImages3 = [];
String? tStoraygeGroupPathName3 = 'test_storayge_group_path_name_3';
