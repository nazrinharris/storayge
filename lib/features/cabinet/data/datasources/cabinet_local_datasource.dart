import 'package:fpdart/fpdart.dart';

import 'package:hive/hive.dart';
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
  Future<Unit> storeAllListSGSnip(List<StoraygeGroupSnippet> allListSGSnip) {
    throw UnimplementedError();
  }

  @override
  Future<List<StoraygeGroupSnippet>> getAllListSGSnipFromLocal() {
    // TODO: implement getAllListSGSnipFromLocal
    throw UnimplementedError();
  }
}
