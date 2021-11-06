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
        if (retrievedSGAllListJson != {"sgSnippetList": []}) {
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
                "This should not happen check back at CabinetRemoteDatasource => getAllListSGSnipFromRemote.",
              );
            },
          );

          return sgSnippetAllList;
        } else {
          final List<StoraygeGroupSnippet> sgSnippetListEmpty = [];

          return sgSnippetListEmpty;
        }
      } else {
        final List<StoraygeGroupSnippet> sgSnippetListEmpty = [];

        return sgSnippetListEmpty;
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
