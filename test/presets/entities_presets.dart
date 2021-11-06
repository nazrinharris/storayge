// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:storayge/core/auth/data/models/storayge_user_model.dart';
import 'package:storayge/core/auth/domain/entities/storayge_user.dart';
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

// Models and JSON

// Concrete Inputs

// TODO: Organize presets

const String tsgNameSnip = 'test_storayge_group_name_snip';
const String tsgIdSnip = 'test_storayge_group_id_snip';
const String tsgDescSnip = 'test_storayge_group_desc_snip';
const String tsgImgPathSnip = 'test_storayge_group_img_path_snip';

const String tsgNameSnip2 = '2_test_storayge_group_name_snip';
const String tsgIdSnip2 = '2_test_storayge_group_id_snip';
const String tsgDescSnip2 = '2_test_storayge_group_desc_snip';
const String tsgImgPathSnip2 = '2_test_storayge_group_img_path_snip';

StoraygeGroupSnippet tStoraygeGroupSnippet = StoraygeGroupSnippet(
  sgId: tsgIdSnip,
  sgName: tsgNameSnip,
  sgDesc: tsgDescSnip,
  sgImgPath: tsgImgPathSnip,
);

StoraygeGroupSnippet tStoraygeGroupSnippet2 = StoraygeGroupSnippet(
  sgId: tsgIdSnip2,
  sgName: tsgNameSnip2,
  sgDesc: tsgDescSnip2,
  sgImgPath: tsgImgPathSnip2,
);

List<StoraygeGroupSnippet> tStoraygeGroupAllListSnipOne = [
  tStoraygeGroupSnippet,
];

List<StoraygeGroupSnippet> tStoraygeGroupAllListSnipTwo = [
  tStoraygeGroupSnippet,
  tStoraygeGroupSnippet2,
];
