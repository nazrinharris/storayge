import 'package:fpdart/fpdart.dart';

import 'package:hive/hive.dart';
import '../../../../core/constants/app_const.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/shelf_model.dart';

abstract class CabinetLocalDataSource {
  Future<ShelfModel> getShelfFromLocal({required String shelfId});
  Future<Unit> storeShelfInLocal({required ShelfModel shelfModel});
}

class CabinetLocalDataSourceImpl implements CabinetLocalDataSource {
  final HiveInterface hiveInterface;

  CabinetLocalDataSourceImpl({
    required this.hiveInterface,
  });

  @override
  Future<ShelfModel> getShelfFromLocal({required String shelfId}) async {
    final box = await hiveInterface.openBox(HIVE_BOX_SHELF);

    final ShelfModel? retrievedShelf = await box.get(shelfId);

    if (retrievedShelf != null) {
      return retrievedShelf;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<Unit> storeShelfInLocal({required ShelfModel shelfModel}) async {
    final box = await hiveInterface.openBox(HIVE_BOX_SHELF);

    await box.put(shelfModel.shelfId, shelfModel);

    return unit;
  }
}
