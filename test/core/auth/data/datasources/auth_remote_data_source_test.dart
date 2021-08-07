import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:storayge/core/auth/data/datasources/auth_remote_data_source.dart';
import 'package:storayge/core/constants/app_const.dart';
import 'package:storayge/core/errors/exceptions.dart';

import '../../../../presets/entities_presets.dart';
import '../../../../presets/failures_exceptions_presets.dart';
import '../../../mock_classes/mock_firebase/mock_firebase.mocks.dart';

void main() {
  late AuthRemoteDataSourceImpl authRemoteDataSourceImpl;

  late MockFirebaseFirestore mockFirebaseFirestore;
  late MockCollectionReference<Map<String, dynamic>> mockCollectionReference;
  late MockDocumentReference<Map<String, dynamic>> mockDocumentReference;
  late MockDocumentSnapshot<Map<String, dynamic>> mockDocumentSnapshot;

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
    authRemoteDataSourceImpl = AuthRemoteDataSourceImpl(
      firebaseFirestore: mockFirebaseFirestore,
      firebaseAuth: mockFirebaseAuth,
    );
  });

  group('getStoraygeUserDataFromRemote', () {
    void setupSuccesfullQuery() {
      when(mockFirebaseFirestore.collection(any))
          .thenAnswer((_) => mockCollectionReference);
      when(mockCollectionReference.doc(any))
          .thenAnswer((_) => mockDocumentReference);
      when(mockDocumentReference.get())
          .thenAnswer((_) async => mockDocumentSnapshot);
      when(mockDocumentSnapshot.data()).thenAnswer((_) => tStoraygeUserJSON);
    }

    void setupFailureQuery() {
      when(mockFirebaseFirestore.collection(any))
          .thenAnswer((_) => mockCollectionReference);
      when(mockCollectionReference.doc(any))
          .thenAnswer((_) => mockDocumentReference);
      when(mockDocumentReference.get()).thenThrow(testFirebaseException);
      when(mockDocumentSnapshot.data()).thenAnswer((_) => tStoraygeUserJSON);
    }

    test(
      'should perform a proper query to CloudFirestore with the passed in uid',
      () async {
        //arrange
        setupSuccesfullQuery();
        // act
        authRemoteDataSourceImpl.getStoraygeUserDataFromRemote(uid: tUid);
        // assert
        verifyInOrder([
          mockFirebaseFirestore.collection(FIRESTORE_USER_COLLECTION),
          mockCollectionReference.doc(tUid),
          mockDocumentReference.get(),
        ]);
      },
    );

    test(
      'should return StoraygeUserModel when the query is succesfull',
      () async {
        //arrange
        setupSuccesfullQuery();
        // act
        final result = await authRemoteDataSourceImpl
            .getStoraygeUserDataFromRemote(uid: tUid);
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
        final call = authRemoteDataSourceImpl.getStoraygeUserDataFromRemote;
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
      when(mockFirebaseFirestore.collection(any))
          .thenAnswer((_) => mockCollectionReference);
      when(mockCollectionReference.doc(any))
          .thenAnswer((_) => mockDocumentReference);
      when(mockDocumentReference.get())
          .thenAnswer((_) async => mockDocumentSnapshot);
      when(mockDocumentSnapshot.data()).thenAnswer((_) => tStoraygeUserJSON);

      when(mockFirebaseAuth.signInWithEmailAndPassword(
              email: anyNamed('email'), password: anyNamed('password')))
          .thenAnswer((_) async => mockUserCredential);
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
              email: anyNamed('email'), password: anyNamed('password')))
          .thenAnswer((_) async => mockUserCredential);
      when(mockUserCredential.user).thenReturn(mockUser);
      when(mockUser.uid).thenReturn(tUid);
    }

    test(
      'should return StoraygeUserModel after succesfull login',
      () async {
        // arrange
        setupSuccesfullQuery();
        // act
        final result = await authRemoteDataSourceImpl.loginWithEmailAndPassword(
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
        await authRemoteDataSourceImpl.loginWithEmailAndPassword(
            email: tEmail, password: tPassword);
        // assert
        verifyInOrder([
          mockFirebaseFirestore.collection(FIRESTORE_USER_COLLECTION),
          mockCollectionReference.doc(tUid),
          mockDocumentReference.get(),
        ]);
      },
    );
  });

  group('registerWithEmailAndPassword', () {
    void setupSuccesfullQuery() {
      when(mockFirebaseFirestore.collection(any))
          .thenAnswer((_) => mockCollectionReference);
      when(mockCollectionReference.doc(any))
          .thenAnswer((_) => mockDocumentReference);
      when(mockDocumentReference.get())
          .thenAnswer((_) async => mockDocumentSnapshot);
      when(mockDocumentSnapshot.data()).thenAnswer((_) => tStoraygeUserJSON);
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
              email: anyNamed('email'), password: anyNamed('password')))
          .thenAnswer((_) async => mockUserCredential);
      when(mockUserCredential.user).thenReturn(mockUser);
      when(mockUser.uid).thenReturn(tUid);
    }

    test(
      'should return StoraygeUserModel after succesfull registration',
      () async {
        // arrange
        setupSuccesfullQuery();
        // act
        final result =
            await authRemoteDataSourceImpl.registerWithEmailAndPassword(
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
        await authRemoteDataSourceImpl.registerWithEmailAndPassword(
          email: tEmail,
          password: tPassword,
          username: tUsername,
        );
        // assert
        verifyInOrder([
          mockFirebaseFirestore.collection(FIRESTORE_USER_COLLECTION),
          mockCollectionReference.doc(tUid),
          mockDocumentReference.set({
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
        when(mockFirebaseAuth.currentUser).thenReturn(mockUser);
        when(mockUser.uid).thenReturn(tUid);
        // act
        final result = await authRemoteDataSourceImpl.getUid();
        // assert
        expect(result, equals(tUid));
      },
    );

    test(
      'should throw UserNotFoundException when no user is logged in',
      () async {
        // arrange
        when(mockFirebaseAuth.currentUser).thenReturn(null);
        // act
        final call = authRemoteDataSourceImpl.getUid;
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
        when(mockFirebaseAuth.signOut())
            .thenAnswer((_) async => Future.value());
        // act
        final result = await authRemoteDataSourceImpl.signOut();
        // assert
        verify(mockFirebaseAuth.signOut());
        expect(result, unit);
      },
    );
  });
}
