// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:storayge/core/constants/app_const.dart';
import 'package:storayge/core/errors/exceptions.dart';
import 'package:storayge/core/errors/failures.dart';

/// Base [FirebaseException]
final FirebaseException testFirebaseException = FirebaseException(
  plugin: 'base',
  code: 'TEST',
  message: 'test_message',
);

/// [CloudFirestore] Exceptions
// final FirestoreException testFirestoreException = FirestoreException(
//   code: 'TEST',
//   message: 'test operation',
// );
// final FirestoreException abortedCloudFirestoreException = FirestoreException(
//   code: 'ABORTED',
//   message: 'The operaation was aborted.',
// );

/// [CloudFirestore Failures] Failures
final FirestoreFailure testFirestoreFailure = FirestoreFailure(
  message: 'test_message',
  code: 'TEST',
);

/// [FirebaseAuth Exceptions]
final FirebaseAuthException testFirebaseAuthException = FirebaseAuthException(
  code: 'TEST',
  message: 'test_message',
);

/// [FirebaseAuth Failures]
final FirebaseAuthFailure testFirebaseAuthFailure = FirebaseAuthFailure(
  code: 'TEST',
  message: 'test_message',
);

/// [Local] Failures
final CacheFailure testCacheFailure = CacheFailure();

final ServerFailure testServerFailure = ServerFailure(
  code: ERROR_NO_INTERNET_CONNECTION,
  message: MESSAGE_NO_INTERNET_CONNECTION,
);

final NoConnectionFailure testNoConnectionFailure = NoConnectionFailure();

final UserFailure testUserFailure = UserFailure(
  code: ERROR_USER_NOT_FOUND,
  message: MESSAGE_USER_NOT_FOUND,
);

/// [Local Exceptions]
final testUserNotFoundException = UserNotFoundException();
final testCacheException = CacheException();
