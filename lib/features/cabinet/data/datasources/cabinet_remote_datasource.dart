import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/constants/app_const.dart';

abstract class ICabinetRemoteDataSource {}

class CabinetRemoteDataSource implements ICabinetRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;

  CabinetRemoteDataSource({
    required this.firebaseFirestore,
  });
}
