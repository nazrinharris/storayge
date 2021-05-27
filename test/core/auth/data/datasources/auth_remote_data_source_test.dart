import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:storayge/core/auth/data/datasources/auth_remote_data_source.dart';
import 'package:storayge/core/constants/app_const.dart';

import '../../../mock_classes/mock_firebase/mock_firebase.mocks.dart';
import '../../../presets/entities_presets.dart';
import '../../../presets/failures_exceptions_presets.dart';

void main() {
  late AuthRemoteDataSourceImpl authRemoteDataSourceImpl;

  late MockFirebaseFirestore mockFirebaseFirestore;
  late MockCollectionReference<Map<String, dynamic>> mockCollectionReference;
  late MockDocumentReference<Map<String, dynamic>> mockDocumentReference;
  late MockDocumentSnapshot<Map<String, dynamic>> mockDocumentSnapshot;

  late MockFirebaseAuth mockFirebaseAuth;

  setUp(() {
    mockFirebaseFirestore = MockFirebaseFirestore();
    mockDocumentSnapshot = MockDocumentSnapshot();
    mockCollectionReference = MockCollectionReference();
    mockDocumentReference = MockDocumentReference();

    mockFirebaseAuth = MockFirebaseAuth();

    authRemoteDataSourceImpl =
        AuthRemoteDataSourceImpl(firebaseFirestore: mockFirebaseFirestore);
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
    test(
      'should attempt to login with proper arguments',
      () async {
        // arrange
        when(mockFirebaseAuth.signInWithEmailAndPassword(
          email: anyNamed('email'),
          password: anyNamed('password'),
        ));
        // act

        // assert
      },
    );
  });
}
