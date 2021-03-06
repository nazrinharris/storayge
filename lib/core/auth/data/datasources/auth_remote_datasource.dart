import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:storayge/core/errors/exceptions.dart';

import '../../../constants/app_const.dart';
import '../models/storayge_user_model.dart';

abstract class IAuthRemoteDataSource {
  /// Query to the Cloud Firestore for the JSON Document of the uid specified
  Future<StoraygeUserModel> getStoraygeUserDataFromRemote({
    required String uid,
  });

  Future<StoraygeUserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<StoraygeUserModel> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  });

  Future<StoraygeUserModel> isLoggedIn();

  Future<bool> isEmailNotRegistered(String email);

  Future<String> getUid();

  Future<Unit> signOut();
}

class AuthRemoteDataSource implements IAuthRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSource({
    required this.firebaseFirestore,
    required this.firebaseAuth,
  });

  @override
  Future<StoraygeUserModel> getStoraygeUserDataFromRemote({
    required String uid,
  }) async {
    try {
      final storaygeUserModel = await firebaseFirestore
          .collection(FS_USER_COLLECTION)
          .doc(uid)
          .get()
          .then((snapshot) => snapshot.data())
          .then((json) => StoraygeUserModel.fromJson(json));
      return storaygeUserModel;
    } on FirebaseException catch (e) {
      throw FirebaseException(
          plugin: FS_PLUGIN, code: e.code, message: e.message ?? 'No message');
    }
  }

  @override
  Future<StoraygeUserModel> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    final resultUid = await firebaseAuth
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((user) => user.user!.uid);
    final storaygeUserModel = await firebaseFirestore
        .collection(FS_USER_COLLECTION)
        .doc(resultUid)
        .get()
        .then((snapshot) => snapshot.data())
        .then((json) => StoraygeUserModel.fromJson(json));
    return storaygeUserModel;
  }

  @override
  Future<StoraygeUserModel> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  }) async {
    final resultUid = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) => user.user!.uid);
    await firebaseFirestore.collection(FS_USER_COLLECTION).doc(resultUid).set({
      'uid': resultUid,
      'email': email,
      'username': username,
    });
    await firebaseFirestore
        .collection(FS_USER_COLLECTION)
        .doc(resultUid)
        .collection(FS_MANAGEMENT_COLLECTION)
        .doc('sgAllList')
        .set({"sgSnippet": []});
    return StoraygeUserModel(
      uid: resultUid,
      username: username,
      email: email,
    );
  }

  @override
  Future<String> getUid() {
    final resultUser = firebaseAuth.currentUser;
    if (resultUser != null) {
      final resultUid = resultUser.uid;
      return Future.value(resultUid);
    } else {
      throw UserNotFoundException();
    }
  }

  @override
  Future<Unit> signOut() async {
    await firebaseAuth.signOut();
    return unit;
  }

  @override
  Future<StoraygeUserModel> isLoggedIn() async {
    // TODO: create tests
    final loggedInUser = firebaseAuth.currentUser;

    if (loggedInUser != null) {
      final storaygeUserModel = await firebaseFirestore
          .collection(FS_USER_COLLECTION)
          .doc(loggedInUser.uid)
          .get()
          .then((snapshot) => snapshot.data())
          .then((json) => StoraygeUserModel.fromJson(json));
      return storaygeUserModel;
    } else {
      throw UserNotFoundException();
    }
  }

  @override
  Future<bool> isEmailNotRegistered(String email) async {
    //todo: tests?
    final List<String> availableSignInMethods =
        await firebaseAuth.fetchSignInMethodsForEmail(email);

    if (availableSignInMethods.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
