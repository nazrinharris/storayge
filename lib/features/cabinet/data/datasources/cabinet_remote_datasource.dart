import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:storayge/features/cabinet/domain/entities/storayge_group.dart';
import '../../../../core/constants/app_const.dart';

abstract class ICabinetRemoteDataSource {
  Future<List<StoraygeGroupSnippet>> getAllListSGSnipFromRemote({
    required String uid,
  });
}

class CabinetRemoteDataSource implements ICabinetRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;

  CabinetRemoteDataSource({
    required this.firebaseFirestore,
  });

  @override
  Future<List<StoraygeGroupSnippet>> getAllListSGSnipFromRemote({
    required String uid,
  }) async {
    try {
      final Map<String, dynamic>? retrievedSGAllListJson =
          await firebaseFirestore
              .collection(FS_USER_COLLECTION)
              .doc(uid)
              .collection(FS_MANAGEMENT_COLLECTION)
              .doc(FS_SGALLLIST_DOC)
              .get()
              .then((snapshot) => snapshot.data());

      if (retrievedSGAllListJson != null) {
        final StoraygeGroup storaygeGroup =
            StoraygeGroupAllList.fromJson(retrievedSGAllListJson);

        final List<StoraygeGroupSnippet> sgSnippetAllList =
            storaygeGroup.maybeMap(
          (_) {
            throw Exception(
              "Expected a StoraygeGroupAllList but received the default StoraygeGroup",
            );
          },
          storaygeGroupAllList: (storaygeGroupAllList) =>
              storaygeGroupAllList.sgAllList,
          orElse: () {
            throw Exception(
              "The variable sgSnippetAllList is null, this could mean that the [sgAllList] document within the [management] collection does not exist.",
            );
          },
        );

        return sgSnippetAllList;
      } else {
        throw FirebaseException(plugin: FS_PLUGIN, message: "Document is null");
      }
    } on FirebaseException catch (e) {
      throw FirebaseException(
        plugin: FS_PLUGIN,
        code: e.code,
        message: e.message,
      );
    }
  }
}
