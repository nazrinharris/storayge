import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

class Shelf extends Equatable {
  @HiveField(0)
  final String shelfName;
  @HiveField(1)
  final String shelfId;
  @HiveField(2)
  final String? shelfDesc;
  @HiveField(3)
  final String? imgPath;
  @HiveField(4)
  final String? pathName;
  @HiveField(5)
  final int? containerAmount;
  @HiveField(6)
  final int? itemAmount;

  const Shelf({
    required this.shelfName,
    required this.shelfId,
    required this.shelfDesc,
    required this.imgPath,
    required this.pathName,
    required this.containerAmount,
    required this.itemAmount,
  });

  @override
  List<Object?> get props => [
        shelfName,
        shelfId,
        shelfDesc,
        imgPath,
        pathName,
        containerAmount,
        itemAmount,
      ];
}
