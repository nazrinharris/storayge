// ignore_for_file: subtype_of_sealed_class
// ignore_for_file: avoid_implementing_value_types

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
  });
}
