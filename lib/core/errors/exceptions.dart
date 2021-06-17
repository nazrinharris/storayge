// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:storayge/core/constants/app_const.dart';

// class FirestoreException extends FirebaseException {
//   FirestoreException({
//     required String code,
//     required String message,
//   }) : super(
//           plugin: FIRESTORE_PLUGIN,
//           code: code,
//           message: message,
//         );
// }

class CacheException implements Exception {}

class AppException implements Exception {}

class UserNotFoundException implements Exception {}
