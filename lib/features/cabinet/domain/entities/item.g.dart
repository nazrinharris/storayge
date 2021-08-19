// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemData _$_$ItemDataFromJson(Map<String, dynamic> json) {
  return _$ItemData(
    itemName: json['itemName'] as String?,
    itemDesc: json['itemDesc'] as String?,
    imgPath:
        (json['imgPath'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  );
}

Map<String, dynamic> _$_$ItemDataToJson(_$ItemData instance) =>
    <String, dynamic>{
      'itemName': instance.itemName,
      'itemDesc': instance.itemDesc,
      'imgPath': instance.imgPath,
    };
