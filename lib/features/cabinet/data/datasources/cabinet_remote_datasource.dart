import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:storayge/features/cabinet/domain/entities/shelf.dart';
import '../../../../core/constants/app_const.dart';
import '../models/shelf_model.dart';

abstract class ICabinetRemoteDataSource {
  Future<ShelfModel> getShelf({
    required String uid,
    required String shelfId,
  });

  Future<Unit> storeShelfInRemote({
    required String uid,
    required ShelfModel shelfModel,
  });

  Future<ShelfModel> getHomeData({
    required String uid,
  });
}

class CabinetRemoteDataSource implements ICabinetRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;

  CabinetRemoteDataSource({
    required this.firebaseFirestore,
  });

  @override
  Future<ShelfModel> getShelf({
    required String uid,
    required String shelfId,
  }) async {
    final ShelfModel? shelfModel = await firebaseFirestore
        .collection(FIRESTORE_USER_COLLECTION)
        .doc(uid)
        .collection(FIRESTORE_SHELF_COLLECTION)
        .doc(shelfId)
        .get()
        .then((snapshot) => snapshot.data())
        .then((json) {
      if (json != null) {
        return ShelfModel.fromJson(json);
      } else {
        return null;
      }
    });

    if (shelfModel == null) {
      throw FirebaseException(
        plugin: FIRESTORE_PLUGIN,
        code: FIRESTORE_ERROR_DOCUMENT_NOT_FOUND,
        message: FIRESTORE_MESSAGE_DOCUMENT_NOT_FOUND,
      );
    } else {
      return shelfModel;
    }
  }

  @override
  Future<Unit> storeShelfInRemote({
    required String uid,
    required ShelfModel shelfModel,
  }) async {
    await firebaseFirestore
        .collection(FIRESTORE_USER_COLLECTION)
        .doc(uid)
        .collection(FIRESTORE_SHELF_COLLECTION)
        .doc(shelfModel.shelfId)
        .set({
      "shelfName": shelfModel.shelfName,
      "shelfId": shelfModel.shelfId,
      "shelfDesc": shelfModel.shelfDesc,
      "imgPath": shelfModel.imgPath,
      "pathName": shelfModel.pathName,
      "containerAmount": shelfModel.containerAmount,
      "itemAmount": shelfModel.itemAmount
    });

    return unit;
  }

  @override
  Future<ShelfModel> getHomeData({required String uid}) {
    throw UnimplementedError();
  }
}
