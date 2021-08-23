// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storayge_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoraygeGroup _$_$_StoraygeGroupFromJson(Map<String, dynamic> json) {
  return _$_StoraygeGroup(
    sgId: json['sgId'] as String,
    sgName: json['sgName'] as String?,
    sgDesc: json['sgDesc'] as String?,
    sgImgPathList: (json['sgImgPathList'] as List<dynamic>?)
        ?.map((e) => e as String?)
        .toList(),
  );
}

Map<String, dynamic> _$_$_StoraygeGroupToJson(_$_StoraygeGroup instance) =>
    <String, dynamic>{
      'sgId': instance.sgId,
      'sgName': instance.sgName,
      'sgDesc': instance.sgDesc,
      'sgImgPathList': instance.sgImgPathList,
    };

_$StoraygeGroupAllList _$_$StoraygeGroupAllListFromJson(
    Map<String, dynamic> json) {
  return _$StoraygeGroupAllList(
    sgAllList: (json['sgSnippet'] as List<dynamic>)
        .map((e) => StoraygeGroupSnippet.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$StoraygeGroupAllListToJson(
        _$StoraygeGroupAllList instance) =>
    <String, dynamic>{
      'sgSnippet': instance.sgAllList.map((e) => e.toJson()).toList(),
    };

_$_StoraygeGroupSnippet _$_$_StoraygeGroupSnippetFromJson(
    Map<String, dynamic> json) {
  return _$_StoraygeGroupSnippet(
    sgId: json['sgId'] as String,
    sgName: json['sgName'] as String,
    sgDesc: json['sgDesc'] as String,
    sgImgPath: json['sgImgPath'] as String,
  );
}

Map<String, dynamic> _$_$_StoraygeGroupSnippetToJson(
        _$_StoraygeGroupSnippet instance) =>
    <String, dynamic>{
      'sgId': instance.sgId,
      'sgName': instance.sgName,
      'sgDesc': instance.sgDesc,
      'sgImgPath': instance.sgImgPath,
    };
