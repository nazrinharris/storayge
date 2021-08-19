import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'item.dart';

part 'storayge_group.freezed.dart';
part 'storayge_group.g.dart';

@freezed
class StoryageGroup with _$StoryageGroup {
  @JsonSerializable(explicitToJson: true)
  const factory StoryageGroup({
    final String? storaygeGroupName,
    final String? storaygeGroupId,
    final int? storaygeGroupAmount,
    final int? itemAmount,
    final String? storaygeGroupDesc,
    final List<String?>? storaygeGroupImages,
    final String? storaygeGroupPathName,
    final List<StoryageGroup?>? storaygeGroupList,
    final List<Item?>? itemList,
  }) = StoraygeGroupData;

  factory StoryageGroup.fromJson(Map<String, dynamic> json) =>
      _$_$StoraygeGroupDataFromJson(json);
}
