// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:storayge/core/constants/app_const.dart';
import 'package:storayge/core/errors/exceptions.dart';
import 'package:storayge/core/errors/failures.dart';

/// [Failures]
final CacheFailure tCacheFailure = CacheFailure();
final NoConnectionFailure tNoConnectionFailure = NoConnectionFailure();
final ServerFailure tServerFailure = ServerFailure(
  code: ERROR_NO_INTERNET_CONNECTION,
  message: MESSAGE_NO_INTERNET_CONNECTION,
);
final UserFailure tUserFailure = UserFailure(
  code: ERROR_USER_NOT_FOUND,
  message: MESSAGE_USER_NOT_FOUND,
);
final FirestoreFailure tFirestoreFailure = FirestoreFailure(
  message: 'test_message',
  code: 'TEST',
);
final FirebaseAuthFailure tFirebaseAuthFailure = FirebaseAuthFailure(
  code: 'TEST',
  message: 'test_message',
);
final StorageFailure tStorageFailure = StorageFailure(
  code: 'TEST',
  message: 'test_message',
);

/// [Exceptions]
final tCacheException = CacheException();
final tUserNotFoundException = UserNotFoundException();
final FirebaseException tFirebaseException = FirebaseException(
  plugin: 'base',
  code: 'TEST',
  message: 'test_message',
);
final FirebaseAuthException tFirebaseAuthException = FirebaseAuthException(
  code: 'TEST',
  message: 'test_message',
);
final StorageException tStorageException = StorageException(
  code: 'TEST',
  message: 'test_message',
);
