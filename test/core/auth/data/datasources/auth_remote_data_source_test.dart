import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:storayge/core/auth/data/datasources/auth_remote_data_source.dart';
import 'package:storayge/core/auth/data/models/storayge_user_model.dart';
import 'package:storayge/core/constants/app_paths.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../mock_classes/mock_firebase/mock_firebase.mocks.dart';

void main() {
  late AuthRemoteDataSourceImpl authRemoteDataSourceImpl;

  late StoraygeUserModel tStoraygeUserModel;
  late Map<String, dynamic> tStoraygeUserJSON;

  late MockFirebaseFirestore mockFirebaseFirestore;
  late MockCollectionReference<Map<String, dynamic>> mockCollectionReference;
  late MockDocumentReference<Map<String, dynamic>> mockDocumentReference;
  late MockDocumentSnapshot<Map<String, dynamic>> mockDocumentSnapshot;

  const String tUid = 'test_uid';

  setUp(() {
    mockFirebaseFirestore = MockFirebaseFirestore();
    mockDocumentSnapshot = MockDocumentSnapshot();
    mockCollectionReference = MockCollectionReference();
    mockDocumentReference = MockDocumentReference();

    /// Important! Make sure the [tStoraygeUserModel] has the exact same field
    /// values as [storayge_user.json]
    tStoraygeUserModel = StoraygeUserModel(
      username: 'test_username',
      email: 'test@test.com',
      uid: 'test_uid',
    );
    tStoraygeUserJSON = json.decode(fixture('storayge_user.json'));

    authRemoteDataSourceImpl =
        AuthRemoteDataSourceImpl(firebaseFirestore: mockFirebaseFirestore);
  });

  group('getStoraygeUserDataFromRemote', () {
    test(
      'should perform a query to CloudFirestore with the passed in uid',
      () async {
        // arrange
        when(mockFirebaseFirestore.collection(any))
            .thenAnswer((_) => mockCollectionReference);
        when(mockCollectionReference.doc(any))
            .thenAnswer((_) => mockDocumentReference);
        when(mockDocumentReference.get())
            .thenAnswer((_) async => mockDocumentSnapshot);
        when(mockDocumentSnapshot.data()).thenAnswer((_) => tStoraygeUserJSON);
        // act
        final result = await authRemoteDataSourceImpl
            .getStoraygeUserDataFromRemote(uid: tUid);
        // assert
        verifyInOrder([
          mockFirebaseFirestore.collection(FIRESTORE_USER_COLLECTION),
          mockCollectionReference.doc(any),
          mockDocumentReference.get(),
          mockDocumentSnapshot.data(),
        ]);
        expect(result, equals(tStoraygeUserModel));
      },
    );
  });
}
