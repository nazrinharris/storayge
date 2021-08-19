import 'package:fpdart/fpdart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:storayge/core/constants/app_const.dart';
import 'package:storayge/core/errors/exceptions.dart';
import 'package:storayge/features/cabinet/data/datasources/cabinet_local_datasource.dart';

import '../../../../presets/entities_presets.dart';

class MockHiveInterface extends Mock implements HiveInterface {}

class MockBox extends Mock implements Box {}

void main() {
  late MockHiveInterface mockHiveInterface;
  late MockBox mockBox;
  late CabinetLocalDataSource cabinetLocalDataSource;

  setUp(() {
    mockHiveInterface = MockHiveInterface();
    mockBox = MockBox();

    cabinetLocalDataSource = CabinetLocalDataSource(
      hiveInterface: mockHiveInterface,
    );
  });
}
