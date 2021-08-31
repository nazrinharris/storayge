import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storayge/features/cabinet/domain/entities/item.dart';

part 'storayge_group.freezed.dart';
part 'storayge_group.g.dart';

@freezed
class StoraygeGroup with _$StoraygeGroup {
  @JsonSerializable(explicitToJson: true)
  factory StoraygeGroup({
    required String sgId,
    required String? sgName,
    required String? sgDesc,
    required List<String?>? sgImgPathList,
    required List<StoraygeGroupSnippet> sgNestedSnippetList,
    required List<Item> itemSnippetList,
  }) = _StoraygeGroup;

  const StoraygeGroup._();

  @JsonSerializable(explicitToJson: true)
  factory StoraygeGroup.storaygeGroupAllList({
    @JsonKey(name: "sgSnippet") required List<StoraygeGroupSnippet> sgAllList,
  }) = StoraygeGroupAllList;

  factory StoraygeGroup.fromJson(Map<String, dynamic> json) =>
      _$StoraygeGroupFromJson(json);
}

@freezed
class StoraygeGroupSnippet with _$StoraygeGroupSnippet {
  const factory StoraygeGroupSnippet({
    required String sgId,
    required String sgName,
    required String sgDesc,
    required String sgImgPath,
  }) = _StoraygeGroupSnippet;

  factory StoraygeGroupSnippet.fromJson(Map<String, dynamic> json) =>
      _$StoraygeGroupSnippetFromJson(json);
}
