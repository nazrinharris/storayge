import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storayge/core/constants/app_const.dart';
import 'package:storayge/features/cabinet/data/datasources/cabinet_remote_datasource.dart';
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

void main() {
  late CabinetRemoteDataSource cabinetRemoteDataSourceImpl;

  late MockFirebaseFirestore mockFirebaseFirestore;
  late MockCollectionReference mockCollectionReference;
  late MockDocumentReference mockDocumentReference;
  late MockDocumentSnapshot mockDocumentSnapshot;

  setUp(() {
    mockFirebaseFirestore = MockFirebaseFirestore();
    mockDocumentSnapshot = MockDocumentSnapshot();
    mockCollectionReference = MockCollectionReference();
    mockDocumentReference = MockDocumentReference();

    cabinetRemoteDataSourceImpl = CabinetRemoteDataSource(
      firebaseFirestore: mockFirebaseFirestore,
    );
  });

  group('getShelf', () {
    void setupSuccesfullQuery() {
      when(() => mockFirebaseFirestore.collection(any()))
          .thenAnswer((_) => mockCollectionReference);
      when(() => mockCollectionReference.doc(any()))
          .thenAnswer((_) => mockDocumentReference);
      when(() => mockDocumentReference.collection(any()))
          .thenAnswer((_) => mockCollectionReference);
      when(() => mockDocumentReference.get())
          .thenAnswer((_) async => mockDocumentSnapshot);
      when(() => mockDocumentSnapshot.data()).thenAnswer((_) => tShelfJSON);
    }

    void setupFailureQuery() {
      when(() => mockFirebaseFirestore.collection(any()))
          .thenAnswer((_) => mockCollectionReference);
      when(() => mockCollectionReference.doc(any()))
          .thenAnswer((_) => mockDocumentReference);
      when(() => mockDocumentReference.collection(any()))
          .thenAnswer((_) => mockCollectionReference);
      when(() => mockDocumentReference.get()).thenThrow(testFirebaseException);
      when(() => mockDocumentSnapshot.data()).thenAnswer((_) => tShelfJSON);
    }

    test(
      'should perform a proper query to Firestore with passed uid',
      () async {
        // arrange
        setupSuccesfullQuery();
        // act
        await cabinetRemoteDataSourceImpl.getShelf(
          uid: tUid,
          shelfId: tShelfId,
        );
        // assert
        verifyInOrder([
          () => mockFirebaseFirestore.collection(FIRESTORE_USER_COLLECTION),
          () => mockCollectionReference.doc(tUid),
          () => mockDocumentReference.collection(FIRESTORE_SHELF_COLLECTION),
          () => mockCollectionReference.doc(tShelfId),
          () => mockDocumentReference.get(),
        ]);
      },
    );
    test(
      'should return ShelfModel when the query is succesfull',
      () async {
        // arrange
        setupSuccesfullQuery();
        // act
        final result = await cabinetRemoteDataSourceImpl.getShelf(
            uid: tUid, shelfId: tShelfId);
        // assert
        expect(result, tShelfModel);
      },
    );

    test(
      'should throw a FirebaseException with FIRESTORE_PLUGIN when an error occurs',
      () async {
        // arrange
        setupFailureQuery();
        // act
        final call = cabinetRemoteDataSourceImpl.getShelf;
        // assert
        expect(
            () => call(uid: tUid, shelfId: tShelfId),
            throwsA(
              predicate((e) => e is FirebaseException && e.code == 'TEST'
                  //e.plugin == FIRESTORE_PLUGIN,
                  ),
            ));
      },
    );
  });

  group('storeShelfInRemote', () {
    // TODO: Create tests
  });
}
