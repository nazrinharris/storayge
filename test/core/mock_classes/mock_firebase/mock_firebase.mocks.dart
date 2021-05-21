// Mocks generated by Mockito 5.0.8 from annotations
// in storayge/test/core/mock_classes/mock_firebase/mock_firebase.dart.
// Do not manually edit this file.

import 'dart:async' as _i7;
import 'dart:typed_data' as _i9;

import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:cloud_firestore_platform_interface/src/get_options.dart'
    as _i10;
import 'package:cloud_firestore_platform_interface/src/persistence_settings.dart'
    as _i8;
import 'package:cloud_firestore_platform_interface/src/set_options.dart'
    as _i15;
import 'package:cloud_firestore_platform_interface/src/settings.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:firebase_auth_platform_interface/src/action_code_info.dart'
    as _i5;
import 'package:firebase_auth_platform_interface/src/action_code_settings.dart'
    as _i11;
import 'package:firebase_auth_platform_interface/src/auth_credential.dart'
    as _i13;
import 'package:firebase_auth_platform_interface/src/auth_provider.dart'
    as _i14;
import 'package:firebase_auth_platform_interface/src/types.dart' as _i12;
import 'package:firebase_core/firebase_core.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeFirebaseApp extends _i1.Fake implements _i2.FirebaseApp {}

class _FakeSettings extends _i1.Fake implements _i3.Settings {}

class _FakeCollectionReference<T extends Object?> extends _i1.Fake
    implements _i4.CollectionReference<T> {}

class _FakeWriteBatch extends _i1.Fake implements _i4.WriteBatch {}

class _FakeLoadBundleTask extends _i1.Fake implements _i4.LoadBundleTask {}

class _FakeQuerySnapshot<T extends Object?> extends _i1.Fake
    implements _i4.QuerySnapshot<T> {}

class _FakeQuery<T extends Object?> extends _i1.Fake implements _i4.Query<T> {}

class _FakeDocumentReference<T extends Object?> extends _i1.Fake
    implements _i4.DocumentReference<T> {}

class _FakeActionCodeInfo extends _i1.Fake implements _i5.ActionCodeInfo {}

class _FakeUserCredential extends _i1.Fake implements _i6.UserCredential {}

class _FakeConfirmationResult extends _i1.Fake
    implements _i6.ConfirmationResult {}

class _FakeFirebaseFirestore extends _i1.Fake implements _i4.FirebaseFirestore {
}

class _FakeDocumentSnapshot<T extends Object?> extends _i1.Fake
    implements _i4.DocumentSnapshot<T> {}

class _FakeSnapshotMetadata extends _i1.Fake implements _i4.SnapshotMetadata {}

/// A class which mocks [FirebaseFirestore].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirebaseFirestore extends _i1.Mock implements _i4.FirebaseFirestore {
  MockFirebaseFirestore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FirebaseApp get app => (super.noSuchMethod(Invocation.getter(#app),
      returnValue: _FakeFirebaseApp()) as _i2.FirebaseApp);
  @override
  set app(_i2.FirebaseApp? _app) =>
      super.noSuchMethod(Invocation.setter(#app, _app),
          returnValueForMissingStub: null);
  @override
  set settings(_i3.Settings? settings) =>
      super.noSuchMethod(Invocation.setter(#settings, settings),
          returnValueForMissingStub: null);
  @override
  _i3.Settings get settings => (super.noSuchMethod(Invocation.getter(#settings),
      returnValue: _FakeSettings()) as _i3.Settings);
  @override
  int get hashCode =>
      (super.noSuchMethod(Invocation.getter(#hashCode), returnValue: 0) as int);
  @override
  Map<dynamic, dynamic> get pluginConstants =>
      (super.noSuchMethod(Invocation.getter(#pluginConstants),
          returnValue: <dynamic, dynamic>{}) as Map<dynamic, dynamic>);
  @override
  _i4.CollectionReference<Map<String, dynamic>> collection(
          String? collectionPath) =>
      (super.noSuchMethod(Invocation.method(#collection, [collectionPath]),
              returnValue: _FakeCollectionReference<Map<String, dynamic>>())
          as _i4.CollectionReference<Map<String, dynamic>>);
  @override
  _i4.WriteBatch batch() => (super.noSuchMethod(Invocation.method(#batch, []),
      returnValue: _FakeWriteBatch()) as _i4.WriteBatch);
  @override
  _i7.Future<void> clearPersistence() =>
      (super.noSuchMethod(Invocation.method(#clearPersistence, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i7.Future<void>);
  @override
  _i7.Future<void> enablePersistence(
          [_i8.PersistenceSettings? persistenceSettings]) =>
      (super.noSuchMethod(
          Invocation.method(#enablePersistence, [persistenceSettings]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i7.Future<void>);
  @override
  _i4.LoadBundleTask loadBundle(_i9.Uint8List? bundle) =>
      (super.noSuchMethod(Invocation.method(#loadBundle, [bundle]),
          returnValue: _FakeLoadBundleTask()) as _i4.LoadBundleTask);
  @override
  _i7.Future<_i4.QuerySnapshot<Map<String, dynamic>>> namedQueryGet(
          String? name,
          {_i10.GetOptions? options = const _i10.GetOptions()}) =>
      (super.noSuchMethod(
          Invocation.method(#namedQueryGet, [name], {#options: options}),
          returnValue: Future<_i4.QuerySnapshot<Map<String, dynamic>>>.value(
              _FakeQuerySnapshot<Map<String, dynamic>>())) as _i7
          .Future<_i4.QuerySnapshot<Map<String, dynamic>>>);
  @override
  _i4.Query<Map<String, dynamic>> collectionGroup(String? collectionPath) =>
      (super.noSuchMethod(Invocation.method(#collectionGroup, [collectionPath]),
              returnValue: _FakeQuery<Map<String, dynamic>>())
          as _i4.Query<Map<String, dynamic>>);
  @override
  _i7.Future<void> disableNetwork() =>
      (super.noSuchMethod(Invocation.method(#disableNetwork, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i7.Future<void>);
  @override
  _i4.DocumentReference<Map<String, dynamic>> doc(String? documentPath) =>
      (super.noSuchMethod(Invocation.method(#doc, [documentPath]),
              returnValue: _FakeDocumentReference<Map<String, dynamic>>())
          as _i4.DocumentReference<Map<String, dynamic>>);
  @override
  _i7.Future<void> enableNetwork() =>
      (super.noSuchMethod(Invocation.method(#enableNetwork, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i7.Future<void>);
  @override
  _i7.Stream<void> snapshotsInSync() =>
      (super.noSuchMethod(Invocation.method(#snapshotsInSync, []),
          returnValue: Stream<void>.empty()) as _i7.Stream<void>);
  @override
  _i7.Future<T> runTransaction<T>(_i4.TransactionHandler<T>? transactionHandler,
          {Duration? timeout = const Duration(seconds: 30)}) =>
      (super.noSuchMethod(
          Invocation.method(
              #runTransaction, [transactionHandler], {#timeout: timeout}),
          returnValue: Future<T>.value(null)) as _i7.Future<T>);
  @override
  _i7.Future<void> terminate() =>
      (super.noSuchMethod(Invocation.method(#terminate, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i7.Future<void>);
  @override
  _i7.Future<void> waitForPendingWrites() =>
      (super.noSuchMethod(Invocation.method(#waitForPendingWrites, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i7.Future<void>);
  @override
  bool operator ==(Object? other) =>
      (super.noSuchMethod(Invocation.method(#==, [other]), returnValue: false)
          as bool);
  @override
  String toString() =>
      (super.noSuchMethod(Invocation.method(#toString, []), returnValue: '')
          as String);
}

/// A class which mocks [FirebaseAuth].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirebaseAuth extends _i1.Mock implements _i6.FirebaseAuth {
  MockFirebaseAuth() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FirebaseApp get app => (super.noSuchMethod(Invocation.getter(#app),
      returnValue: _FakeFirebaseApp()) as _i2.FirebaseApp);
  @override
  set app(_i2.FirebaseApp? _app) =>
      super.noSuchMethod(Invocation.setter(#app, _app),
          returnValueForMissingStub: null);
  @override
  Map<dynamic, dynamic> get pluginConstants =>
      (super.noSuchMethod(Invocation.getter(#pluginConstants),
          returnValue: <dynamic, dynamic>{}) as Map<dynamic, dynamic>);
  @override
  _i7.Future<void> useEmulator(String? origin) =>
      (super.noSuchMethod(Invocation.method(#useEmulator, [origin]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i7.Future<void>);
  @override
  _i7.Future<void> applyActionCode(String? code) =>
      (super.noSuchMethod(Invocation.method(#applyActionCode, [code]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i7.Future<void>);
  @override
  _i7.Future<_i5.ActionCodeInfo> checkActionCode(String? code) =>
      (super.noSuchMethod(Invocation.method(#checkActionCode, [code]),
              returnValue:
                  Future<_i5.ActionCodeInfo>.value(_FakeActionCodeInfo()))
          as _i7.Future<_i5.ActionCodeInfo>);
  @override
  _i7.Future<void> confirmPasswordReset({String? code, String? newPassword}) =>
      (super.noSuchMethod(
          Invocation.method(#confirmPasswordReset, [],
              {#code: code, #newPassword: newPassword}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i7.Future<void>);
  @override
  _i7.Future<_i6.UserCredential> createUserWithEmailAndPassword(
          {String? email, String? password}) =>
      (super.noSuchMethod(
              Invocation.method(#createUserWithEmailAndPassword, [],
                  {#email: email, #password: password}),
              returnValue:
                  Future<_i6.UserCredential>.value(_FakeUserCredential()))
          as _i7.Future<_i6.UserCredential>);
  @override
  _i7.Future<List<String>> fetchSignInMethodsForEmail(String? email) => (super
          .noSuchMethod(Invocation.method(#fetchSignInMethodsForEmail, [email]),
              returnValue: Future<List<String>>.value(<String>[]))
      as _i7.Future<List<String>>);
  @override
  _i7.Future<_i6.UserCredential> getRedirectResult() => (super.noSuchMethod(
          Invocation.method(#getRedirectResult, []),
          returnValue: Future<_i6.UserCredential>.value(_FakeUserCredential()))
      as _i7.Future<_i6.UserCredential>);
  @override
  bool isSignInWithEmailLink(String? emailLink) => (super.noSuchMethod(
      Invocation.method(#isSignInWithEmailLink, [emailLink]),
      returnValue: false) as bool);
  @override
  _i7.Stream<_i6.User?> authStateChanges() =>
      (super.noSuchMethod(Invocation.method(#authStateChanges, []),
          returnValue: Stream<_i6.User?>.empty()) as _i7.Stream<_i6.User?>);
  @override
  _i7.Stream<_i6.User?> idTokenChanges() =>
      (super.noSuchMethod(Invocation.method(#idTokenChanges, []),
          returnValue: Stream<_i6.User?>.empty()) as _i7.Stream<_i6.User?>);
  @override
  _i7.Stream<_i6.User?> userChanges() =>
      (super.noSuchMethod(Invocation.method(#userChanges, []),
          returnValue: Stream<_i6.User?>.empty()) as _i7.Stream<_i6.User?>);
  @override
  _i7.Future<void> sendPasswordResetEmail(
          {String? email, _i11.ActionCodeSettings? actionCodeSettings}) =>
      (super.noSuchMethod(
          Invocation.method(#sendPasswordResetEmail, [],
              {#email: email, #actionCodeSettings: actionCodeSettings}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i7.Future<void>);
  @override
  _i7.Future<void> sendSignInLinkToEmail(
          {String? email, _i11.ActionCodeSettings? actionCodeSettings}) =>
      (super.noSuchMethod(
          Invocation.method(#sendSignInLinkToEmail, [],
              {#email: email, #actionCodeSettings: actionCodeSettings}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i7.Future<void>);
  @override
  _i7.Future<void> setLanguageCode(String? languageCode) =>
      (super.noSuchMethod(Invocation.method(#setLanguageCode, [languageCode]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i7.Future<void>);
  @override
  _i7.Future<void> setSettings(
          {bool? appVerificationDisabledForTesting, String? userAccessGroup}) =>
      (super.noSuchMethod(
          Invocation.method(#setSettings, [], {
            #appVerificationDisabledForTesting:
                appVerificationDisabledForTesting,
            #userAccessGroup: userAccessGroup
          }),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i7.Future<void>);
  @override
  _i7.Future<void> setPersistence(_i12.Persistence? persistence) =>
      (super.noSuchMethod(Invocation.method(#setPersistence, [persistence]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i7.Future<void>);
  @override
  _i7.Future<_i6.UserCredential> signInAnonymously() => (super.noSuchMethod(
          Invocation.method(#signInAnonymously, []),
          returnValue: Future<_i6.UserCredential>.value(_FakeUserCredential()))
      as _i7.Future<_i6.UserCredential>);
  @override
  _i7.Future<_i6.UserCredential> signInWithCredential(
          _i13.AuthCredential? credential) =>
      (super.noSuchMethod(
              Invocation.method(#signInWithCredential, [credential]),
              returnValue:
                  Future<_i6.UserCredential>.value(_FakeUserCredential()))
          as _i7.Future<_i6.UserCredential>);
  @override
  _i7.Future<_i6.UserCredential> signInWithCustomToken(String? token) =>
      (super.noSuchMethod(Invocation.method(#signInWithCustomToken, [token]),
              returnValue:
                  Future<_i6.UserCredential>.value(_FakeUserCredential()))
          as _i7.Future<_i6.UserCredential>);
  @override
  _i7.Future<_i6.UserCredential> signInWithEmailAndPassword(
          {String? email, String? password}) =>
      (super.noSuchMethod(
              Invocation.method(#signInWithEmailAndPassword, [],
                  {#email: email, #password: password}),
              returnValue:
                  Future<_i6.UserCredential>.value(_FakeUserCredential()))
          as _i7.Future<_i6.UserCredential>);
  @override
  _i7.Future<_i6.UserCredential> signInWithEmailLink(
          {String? email, String? emailLink}) =>
      (super.noSuchMethod(
          Invocation.method(
              #signInWithEmailLink, [], {#email: email, #emailLink: emailLink}),
          returnValue:
              Future<_i6.UserCredential>.value(_FakeUserCredential())) as _i7
          .Future<_i6.UserCredential>);
  @override
  _i7.Future<_i6.ConfirmationResult> signInWithPhoneNumber(String? phoneNumber,
          [_i6.RecaptchaVerifier? verifier]) =>
      (super.noSuchMethod(
          Invocation.method(#signInWithPhoneNumber, [phoneNumber, verifier]),
          returnValue: Future<_i6.ConfirmationResult>.value(
              _FakeConfirmationResult())) as _i7
          .Future<_i6.ConfirmationResult>);
  @override
  _i7.Future<_i6.UserCredential> signInWithPopup(_i14.AuthProvider? provider) =>
      (super.noSuchMethod(Invocation.method(#signInWithPopup, [provider]),
              returnValue:
                  Future<_i6.UserCredential>.value(_FakeUserCredential()))
          as _i7.Future<_i6.UserCredential>);
  @override
  _i7.Future<void> signInWithRedirect(_i14.AuthProvider? provider) =>
      (super.noSuchMethod(Invocation.method(#signInWithRedirect, [provider]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i7.Future<void>);
  @override
  _i7.Future<void> signOut() =>
      (super.noSuchMethod(Invocation.method(#signOut, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i7.Future<void>);
  @override
  _i7.Future<String> verifyPasswordResetCode(String? code) =>
      (super.noSuchMethod(Invocation.method(#verifyPasswordResetCode, [code]),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<void> verifyPhoneNumber(
          {String? phoneNumber,
          _i12.PhoneVerificationCompleted? verificationCompleted,
          _i12.PhoneVerificationFailed? verificationFailed,
          _i12.PhoneCodeSent? codeSent,
          _i12.PhoneCodeAutoRetrievalTimeout? codeAutoRetrievalTimeout,
          String? autoRetrievedSmsCodeForTesting,
          Duration? timeout = const Duration(seconds: 30),
          int? forceResendingToken}) =>
      (super.noSuchMethod(
          Invocation.method(#verifyPhoneNumber, [], {
            #phoneNumber: phoneNumber,
            #verificationCompleted: verificationCompleted,
            #verificationFailed: verificationFailed,
            #codeSent: codeSent,
            #codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
            #autoRetrievedSmsCodeForTesting: autoRetrievedSmsCodeForTesting,
            #timeout: timeout,
            #forceResendingToken: forceResendingToken
          }),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i7.Future<void>);
  @override
  String toString() =>
      (super.noSuchMethod(Invocation.method(#toString, []), returnValue: '')
          as String);
}

/// A class which mocks [CollectionReference].
///
/// See the documentation for Mockito's code generation for more information.
// ignore: must_be_immutable
class MockCollectionReference<T extends Object?> extends _i1.Mock
    implements _i4.CollectionReference<T> {
  MockCollectionReference() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get id =>
      (super.noSuchMethod(Invocation.getter(#id), returnValue: '') as String);
  @override
  String get path =>
      (super.noSuchMethod(Invocation.getter(#path), returnValue: '') as String);
  @override
  _i7.Future<_i4.DocumentReference<T>> add(T? data) =>
      (super.noSuchMethod(Invocation.method(#add, [data]),
              returnValue: Future<_i4.DocumentReference<T>>.value(
                  _FakeDocumentReference<T>()))
          as _i7.Future<_i4.DocumentReference<T>>);
  @override
  _i4.DocumentReference<T> doc([String? path]) => (super.noSuchMethod(
      Invocation.method(#doc, [path]),
      returnValue: _FakeDocumentReference<T>()) as _i4.DocumentReference<T>);
  @override
  _i4.CollectionReference<R> withConverter<R extends Object?>(
          {_i4.FromFirestore<R>? fromFirestore,
          _i4.ToFirestore<R>? toFirestore}) =>
      (super.noSuchMethod(
              Invocation.method(#withConverter, [],
                  {#fromFirestore: fromFirestore, #toFirestore: toFirestore}),
              returnValue: _FakeCollectionReference<R>())
          as _i4.CollectionReference<R>);
}

/// A class which mocks [DocumentReference].
///
/// See the documentation for Mockito's code generation for more information.
// ignore: must_be_immutable
class MockDocumentReference<T extends Object?> extends _i1.Mock
    implements _i4.DocumentReference<T> {
  MockDocumentReference() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.FirebaseFirestore get firestore =>
      (super.noSuchMethod(Invocation.getter(#firestore),
          returnValue: _FakeFirebaseFirestore()) as _i4.FirebaseFirestore);
  @override
  String get id =>
      (super.noSuchMethod(Invocation.getter(#id), returnValue: '') as String);
  @override
  _i4.CollectionReference<T> get parent =>
      (super.noSuchMethod(Invocation.getter(#parent),
              returnValue: _FakeCollectionReference<T>())
          as _i4.CollectionReference<T>);
  @override
  String get path =>
      (super.noSuchMethod(Invocation.getter(#path), returnValue: '') as String);
  @override
  _i4.CollectionReference<Map<String, dynamic>> collection(
          String? collectionPath) =>
      (super.noSuchMethod(Invocation.method(#collection, [collectionPath]),
              returnValue: _FakeCollectionReference<Map<String, dynamic>>())
          as _i4.CollectionReference<Map<String, dynamic>>);
  @override
  _i7.Future<void> delete() =>
      (super.noSuchMethod(Invocation.method(#delete, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i7.Future<void>);
  @override
  _i7.Future<void> update(Map<String, Object?>? data) =>
      (super.noSuchMethod(Invocation.method(#update, [data]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i7.Future<void>);
  @override
  _i7.Future<_i4.DocumentSnapshot<T>> get([_i10.GetOptions? options]) =>
      (super.noSuchMethod(Invocation.method(#get, [options]),
              returnValue: Future<_i4.DocumentSnapshot<T>>.value(
                  _FakeDocumentSnapshot<T>()))
          as _i7.Future<_i4.DocumentSnapshot<T>>);
  @override
  _i7.Stream<_i4.DocumentSnapshot<T>> snapshots(
          {bool? includeMetadataChanges = false}) =>
      (super.noSuchMethod(
              Invocation.method(#snapshots, [],
                  {#includeMetadataChanges: includeMetadataChanges}),
              returnValue: Stream<_i4.DocumentSnapshot<T>>.empty())
          as _i7.Stream<_i4.DocumentSnapshot<T>>);
  @override
  _i7.Future<void> set(T? data, [_i15.SetOptions? options]) =>
      (super.noSuchMethod(Invocation.method(#set, [data, options]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i7.Future<void>);
  @override
  _i4.DocumentReference<R> withConverter<R>(
          {_i4.FromFirestore<R>? fromFirestore,
          _i4.ToFirestore<R>? toFirestore}) =>
      (super.noSuchMethod(
              Invocation.method(#withConverter, [],
                  {#fromFirestore: fromFirestore, #toFirestore: toFirestore}),
              returnValue: _FakeDocumentReference<R>())
          as _i4.DocumentReference<R>);
}

/// A class which mocks [DocumentSnapshot].
///
/// See the documentation for Mockito's code generation for more information.
class MockDocumentSnapshot<T extends Object?> extends _i1.Mock
    implements _i4.DocumentSnapshot<T> {
  MockDocumentSnapshot() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get id =>
      (super.noSuchMethod(Invocation.getter(#id), returnValue: '') as String);
  @override
  _i4.DocumentReference<T> get reference => (super.noSuchMethod(
      Invocation.getter(#reference),
      returnValue: _FakeDocumentReference<T>()) as _i4.DocumentReference<T>);
  @override
  _i4.SnapshotMetadata get metadata =>
      (super.noSuchMethod(Invocation.getter(#metadata),
          returnValue: _FakeSnapshotMetadata()) as _i4.SnapshotMetadata);
  @override
  bool get exists =>
      (super.noSuchMethod(Invocation.getter(#exists), returnValue: false)
          as bool);
  @override
  dynamic get(Object? field) =>
      super.noSuchMethod(Invocation.method(#get, [field]));
  @override
  dynamic operator [](Object? field) =>
      super.noSuchMethod(Invocation.method(#[], [field]));
}
