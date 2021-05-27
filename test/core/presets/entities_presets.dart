// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:storayge/core/auth/data/models/storayge_user_model.dart';
import 'package:storayge/core/auth/domain/entities/storayge_user.dart';

import '../fixtures/fixture_reader.dart';

// Entities
StoraygeUser tStoraygeUser = const StoraygeUser(
  username: 'test_username',
  email: 'test@test.com',
  uid: 'test_uid',
);

// Models and JSON
StoraygeUserModel tStoraygeUserModel = StoraygeUserModel(
  username: 'test_username',
  email: 'test@test.com',
  uid: 'test_uid',
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
