import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:storayge/core/constants/app_paths.dart';

import '../models/storayge_user_model.dart';

abstract class AuthRemoteDataSource {
  /// Query to the Cloud Firestore for the JSON Document of the uid specified
  Future<StoraygeUserModel> getStoraygeUserDataFromRemote({
    required String uid,
  });

  Future<StoraygeUserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;

  AuthRemoteDataSourceImpl({
    required this.firebaseFirestore,
  });

  @override
  Future<StoraygeUserModel> getStoraygeUserDataFromRemote(
      {required String uid}) async {
    final Map<String, dynamic>? storaygeUserJson = (await firebaseFirestore
            .collection(FIRESTORE_USER_COLLECTION)
            .doc(uid)
            .get())
        .data();
    final storaygeUserModel = StoraygeUserModel.fromJson(storaygeUserJson);
    return Future.value(storaygeUserModel);
  }

  @override
  Future<StoraygeUserModel> loginWithEmailAndPassword(
      {required String email, required String password}) {
    // TODO: implement loginWithEmailAndPassword
    throw UnimplementedError();
  }
}
