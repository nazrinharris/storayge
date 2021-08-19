// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storayge_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoraygeGroupData _$_$StoraygeGroupDataFromJson(Map<String, dynamic> json) {
  return _$StoraygeGroupData(
    storaygeGroupName: json['storaygeGroupName'] as String?,
    storaygeGroupId: json['storaygeGroupId'] as String?,
    storaygeGroupAmount: json['storaygeGroupAmount'] as int?,
    itemAmount: json['itemAmount'] as int?,
    storaygeGroupDesc: json['storaygeGroupDesc'] as String?,
    storaygeGroupImages: (json['storaygeGroupImages'] as List<dynamic>?)
        ?.map((e) => e as String?)
        .toList(),
    storaygeGroupPathName: json['storaygeGroupPathName'] as String?,
    storaygeGroupList: (json['storaygeGroupList'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : StoryageGroup.fromJson(e as Map<String, dynamic>))
        .toList(),
    itemList: (json['itemList'] as List<dynamic>?)
        ?.map(
            (e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$StoraygeGroupDataToJson(
        _$StoraygeGroupData instance) =>
    <String, dynamic>{
      'storaygeGroupName': instance.storaygeGroupName,
      'storaygeGroupId': instance.storaygeGroupId,
      'storaygeGroupAmount': instance.storaygeGroupAmount,
      'itemAmount': instance.itemAmount,
      'storaygeGroupDesc': instance.storaygeGroupDesc,
      'storaygeGroupImages': instance.storaygeGroupImages,
      'storaygeGroupPathName': instance.storaygeGroupPathName,
      'storaygeGroupList':
          instance.storaygeGroupList?.map((e) => e?.toJson()).toList(),
      'itemList': instance.itemList?.map((e) => e?.toJson()).toList(),
    };

_$Snippet _$_$SnippetFromJson(Map<String, dynamic> json) {
  return _$Snippet(
    storaygeGroupId: json['storaygeGroupId'] as String,
  );
}

Map<String, dynamic> _$_$SnippetToJson(_$Snippet instance) => <String, dynamic>{
      'storaygeGroupId': instance.storaygeGroupId,
    };
