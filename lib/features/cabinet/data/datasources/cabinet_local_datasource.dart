import 'package:fpdart/fpdart.dart';

import 'package:hive/hive.dart';
import 'package:storayge/core/constants/app_const.dart';
import 'package:storayge/features/cabinet/domain/entities/storayge_group.dart';

abstract class ICabinetLocalDataSource {
  Future<Unit> storeAllListSGSnip(List<StoraygeGroupSnippet> allListSGSnip);
  Future<List<StoraygeGroupSnippet>> getAllListSGSnipFromLocal();
}

class CabinetLocalDataSource implements ICabinetLocalDataSource {
  final HiveInterface hiveInterface;

  CabinetLocalDataSource({
    required this.hiveInterface,
  });

  @override
  Future<Unit> storeAllListSGSnip(
    List<StoraygeGroupSnippet> allListSGSnip,
  ) async {
    final allListSGSnipBox = await hiveInterface.openBox(HIVE_ALL_LIST_SG_SNIP);

    for (final StoraygeGroupSnippet snippet in allListSGSnip) {
      allListSGSnipBox.put(snippet.sgId, snippet.toJson());
      print('Stored ${snippet.sgId}');
    }

    return unit;
  }

  @override
  Future<List<StoraygeGroupSnippet>> getAllListSGSnipFromLocal() async {
    final allListSGSnipBox = await hiveInterface.openBox(HIVE_ALL_LIST_SG_SNIP);

    final List<StoraygeGroupSnippet> retrievedList = <StoraygeGroupSnippet>[];

    final boxMap = Map<String, dynamic>.from(allListSGSnipBox.toMap());

    boxMap.forEach((sgId, sgSnippet) {
      retrievedList.add(StoraygeGroupSnippet.fromJson(sgSnippet));
    });

    // bool isAtTheEnd = false;
    // int index = 0;

    // while (isAtTheEnd == false) {
    //   Map<String, dynamic>? retrievedSnippetJson =
    //       allListSGSnipBox.getAt(index);

    //   if (retrievedSnippetJson != null) {
    //     retrievedList.add(StoraygeGroupSnippet.fromJson(retrievedSnippetJson));
    //     index++;
    //   } else {
    //     isAtTheEnd = true;
    //   }
    // }

    return retrievedList;
  }
}
