import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storayge/core/auth/data/datasources/auth_remote_data_source.dart';
import 'package:storayge/core/constants/app_const.dart';
import 'package:storayge/core/errors/exceptions.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../presets/entities_presets.dart';
import '../../../../presets/failures_exceptions_presets.dart';

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

class MockCollectionReference extends Mock
    implements CollectionReference<Map<String, dynamic>> {}

class MockDocumentReference extends Mock
    implements DocumentReference<Map<String, dynamic>> {}

class MockDocumentSnapshot extends Mock
    implements DocumentSnapshot<Map<String, dynamic>> {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUserCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {}

void main() {
  late AuthRemoteDataSource authRemoteDataSource;

  late MockFirebaseFirestore mockFirebaseFirestore;
  late MockCollectionReference mockCollectionReference;
  late MockDocumentReference mockDocumentReference;
  late MockDocumentSnapshot mockDocumentSnapshot;

  late MockFirebaseAuth mockFirebaseAuth;
  late MockUserCredential mockUserCredential;
  late MockUser mockUser;

  setUp(() {
    mockFirebaseFirestore = MockFirebaseFirestore();
    mockDocumentSnapshot = MockDocumentSnapshot();
    mockCollectionReference = MockCollectionReference();
    mockDocumentReference = MockDocumentReference();

    mockFirebaseAuth = MockFirebaseAuth();
    mockUserCredential = MockUserCredential();
    mockUser = MockUser();
    authRemoteDataSource = AuthRemoteDataSource(
      firebaseFirestore: mockFirebaseFirestore,
      firebaseAuth: mockFirebaseAuth,
    );
  });

  group('getStoraygeUserDataFromRemote', () {
    void setupSuccesfullQuery() {
      when(() => mockFirebaseFirestore.collection(any()))
          .thenAnswer((_) => mockCollectionReference);
      when(() => mockCollectionReference.doc(any()))
          .thenAnswer((_) => mockDocumentReference);
      when(() => mockDocumentReference.get())
          .thenAnswer((_) async => mockDocumentSnapshot);
      when(() => mockDocumentSnapshot.data())
          .thenAnswer((_) => tStoraygeUserJSON);
    }

    void setupFailureQuery() {
      when(() => mockFirebaseFirestore.collection(any()))
          .thenAnswer((_) => mockCollectionReference);
      when(() => mockCollectionReference.doc(any()))
          .thenAnswer((_) => mockDocumentReference);
      when(() => mockDocumentReference.get()).thenThrow(testFirebaseException);
      when(() => mockDocumentSnapshot.data())
          .thenAnswer((_) => tStoraygeUserJSON);
    }

    test(
      'should perform a proper query to CloudFirestore with the passed in uid',
      () async {
        //arrange
        setupSuccesfullQuery();
        // act
        authRemoteDataSource.getStoraygeUserDataFromRemote(uid: tUid);
        // assert
        verifyInOrder([
          () => mockFirebaseFirestore.collection(FIRESTORE_USER_COLLECTION),
          () => mockCollectionReference.doc(tUid),
          () => mockDocumentReference.get(),
        ]);
      },
    );

    test(
      'should return StoraygeUserModel when the query is succesfull',
      () async {
        //arrange
        setupSuccesfullQuery();
        // act
        final result =
            await authRemoteDataSource.getStoraygeUserDataFromRemote(uid: tUid);
        // assert
        expect(result, equals(tStoraygeUserModel));
      },
    );

    test(
      'should throw a FirebaseException with FIRESTORE_PLUGIN when an error occurs',
      () async {
        // arrange
        setupFailureQuery();
        // act
        final call = authRemoteDataSource.getStoraygeUserDataFromRemote;
        // assert
        expect(
            () => call(uid: tUid),
            throwsA(predicate((e) =>
                e is FirebaseException &&
                e.code == 'TEST' &&
                e.plugin == FIRESTORE_PLUGIN)));
      },
    );
  });

  group('loginWithEmailAndPassword', () {
    void setupSuccesfullQuery() {
      when(() => mockFirebaseFirestore.collection(any()))
          .thenAnswer((_) => mockCollectionReference);
      when(() => mockCollectionReference.doc(any()))
          .thenAnswer((_) => mockDocumentReference);
      when(() => mockDocumentReference.get())
          .thenAnswer((_) async => mockDocumentSnapshot);
      when(() => mockDocumentSnapshot.data())
          .thenAnswer((_) => tStoraygeUserJSON);

      when(() => mockFirebaseAuth.signInWithEmailAndPassword(
              email: any(named: 'email'), password: any(named: 'password')))
          .thenAnswer((_) async => mockUserCredential);
      when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
              email: any(named: 'email'), password: any(named: 'password')))
          .thenAnswer((_) async => mockUserCredential);
      when(() => mockUserCredential.user).thenReturn(mockUser);
      when(() => mockUser.uid).thenReturn(tUid);
    }

    test(
      'should return StoraygeUserModel after succesfull login',
      () async {
        // arrange
        setupSuccesfullQuery();
        // act
        final result = await authRemoteDataSource.loginWithEmailAndPassword(
            email: tEmail, password: tPassword);
        // assert
        expect(result, equals(tStoraygeUserModel));
      },
    );

    test(
      'should perform proper query to Firestore after succesfull login',
      () async {
        // arrange
        setupSuccesfullQuery();
        // act
        await authRemoteDataSource.loginWithEmailAndPassword(
            email: tEmail, password: tPassword);
        // assert
        verifyInOrder([
          () => mockFirebaseFirestore.collection(FIRESTORE_USER_COLLECTION),
          () => mockCollectionReference.doc(tUid),
          () => mockDocumentReference.get(),
        ]);
      },
    );
  });

  group('registerWithEmailAndPassword', () {
    void setupSuccesfullQuery() {
      when(() => mockFirebaseFirestore.collection(any()))
          .thenAnswer((_) => mockCollectionReference);
      when(() => mockCollectionReference.doc(any()))
          .thenAnswer((_) => mockDocumentReference);
      when(() => mockDocumentReference.get())
          .thenAnswer((_) async => mockDocumentSnapshot);
      when(() => mockDocumentReference.set(any()))
          .thenAnswer((_) async => Future.value());
      when(() => mockDocumentSnapshot.data())
          .thenAnswer((_) => tStoraygeUserJSON);
      when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
              email: any(named: 'email'), password: any(named: 'password')))
          .thenAnswer((_) async => mockUserCredential);
      when(() => mockUserCredential.user).thenReturn(mockUser);
      when(() => mockUser.uid).thenReturn(tUid);
    }

    test(
      'should return StoraygeUserModel after succesfull registration',
      () async {
        // arrange
        setupSuccesfullQuery();
        // act
        final result = await authRemoteDataSource.registerWithEmailAndPassword(
          email: tEmail,
          password: tPassword,
          username: tUsername,
        );
        // assert
        expect(result, equals(tStoraygeUserModel));
      },
    );

    test(
      'should perform proper query to Firestore after succesfull registration',
      () async {
        // arrange
        setupSuccesfullQuery();
        // act
        await authRemoteDataSource.registerWithEmailAndPassword(
          email: tEmail,
          password: tPassword,
          username: tUsername,
        );
        // assert
        verifyInOrder([
          () => mockFirebaseFirestore.collection(FIRESTORE_USER_COLLECTION),
          () => mockCollectionReference.doc(tUid),
          () => mockDocumentReference.set({
                'uid': tUid,
                'email': tEmail,
                'username': tUsername,
              }),
        ]);
      },
    );
  });

  group('getUid', () {
    test(
      'should return proper uid when there is a user logged in',
      () async {
        // arrange
        when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);
        when(() => mockUser.uid).thenReturn(tUid);
        // act
        final result = await authRemoteDataSource.getUid();
        // assert
        expect(result, equals(tUid));
      },
    );

    test(
      'should throw UserNotFoundException when no user is logged in',
      () async {
        // arrange
        when(() => mockFirebaseAuth.currentUser).thenReturn(null);
        // act
        final call = authRemoteDataSource.getUid;
        // assert
        expect(() => call(), throwsA(isA<UserNotFoundException>()));
      },
    );
  });

  group('signOut', () {
    test(
      'should call signOut() from firebaseAuth',
      () async {
        // arrange
        when(() => mockFirebaseAuth.signOut())
            .thenAnswer((_) async => Future.value());
        // act
        final result = await authRemoteDataSource.signOut();
        // assert
        verify(() => mockFirebaseAuth.signOut());
        expect(result, unit);
      },
    );
  });
}
