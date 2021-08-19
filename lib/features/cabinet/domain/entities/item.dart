import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  @JsonSerializable()
  factory Item({
    required String? itemName,
    required String? itemDesc,
    required List<String?>? imgPath,
  }) = ItemData;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
