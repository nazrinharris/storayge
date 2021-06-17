// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:storayge/core/auth/data/models/storayge_user_model.dart';
import 'package:storayge/core/auth/domain/entities/storayge_user.dart';
import 'package:storayge/features/cabinet/data/models/shelf_model.dart';
import 'package:storayge/features/cabinet/domain/entities/shelf.dart';

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
Shelf tShelf = Shelf(
  shelfName: tShelfName,
  shelfId: tShelfId,
  shelfDesc: tShelfDesc,
  imgPath: tImgPath,
  pathName: tPathName,
  containerAmount: tContainerAmount,
  itemAmount: tItemAmount,
);

// Models and JSON
ShelfModel tShelfModel = ShelfModel(
  shelfName: tShelfName,
  shelfId: tShelfId,
  shelfDesc: tShelfDesc,
  imgPath: tImgPath,
  pathName: tPathName,
  containerAmount: tContainerAmount,
  itemAmount: tItemAmount,
);
Map<String, dynamic> tShelfJSON = json.decode(fixture('shelf.json'));

// Concrete Inputs
const String tShelfName = 'test_shelf_name';
const String tShelfId = 'test_shelf_id';
const String tShelfDesc = 'test_shelf_desc';
const String tImgPath = 'test_img_path';
const String tPathName = 'test_path_name';
const int tContainerAmount = 0;
const int tItemAmount = 0;
