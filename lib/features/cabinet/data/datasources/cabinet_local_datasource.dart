import 'package:fpdart/fpdart.dart';

import 'package:hive/hive.dart';
import '../../../../core/constants/app_const.dart';
import '../../../../core/errors/exceptions.dart';

abstract class ICabinetLocalDataSource {}

class CabinetLocalDataSource implements ICabinetLocalDataSource {
  final HiveInterface hiveInterface;

  CabinetLocalDataSource({
    required this.hiveInterface,
  });
}
