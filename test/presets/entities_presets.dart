// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:storayge/core/auth/data/models/storayge_user_model.dart';
import 'package:storayge/core/auth/domain/entities/storayge_user.dart';

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
