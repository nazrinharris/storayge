import 'package:hive/hive.dart';
import '../../domain/entities/shelf.dart';

part 'shelf_model.g.dart';

@HiveType(typeId: 1)
class ShelfModel extends Shelf with HiveObjectMixin {
  ShelfModel({
    required String shelfName,
    required String shelfId,
    required String shelfDesc,
    required String imgPath,
    required String pathName,
    required int containerAmount,
    required int itemAmount,
  }) : super(
          shelfName: shelfName,
          shelfId: shelfId,
          shelfDesc: shelfDesc,
          imgPath: imgPath,
          pathName: pathName,
          containerAmount: containerAmount,
          itemAmount: itemAmount,
        );

  factory ShelfModel.fromJson(Map<String, dynamic>? json) {
    return ShelfModel(
      shelfName: json!['shelfName'],
      shelfId: json['shelfId'],
      shelfDesc: json['shelfDesc'],
      imgPath: json['imgPath'],
      pathName: json['pathName'],
      containerAmount: json['containerAmount'],
      itemAmount: json['itemAmount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "shelfName": shelfName,
      "shelfId": shelfId,
      "shelfDesc": shelfDesc,
      "imgPath": imgPath,
      "pathName": pathName,
      "containerAmount": 0,
      "itemAmount": 0,
    };
  }
}
